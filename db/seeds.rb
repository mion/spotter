puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email first_name: ENV['ADMIN_FIRST_NAME'].dup, last_name: ENV['ADMIN_LAST_NAME'], :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.first_name
user.add_role :admin

fn = ["John", "Jack", "Jane"]
ln = ["Smith", "Souza", "Doe"]
(YAML.load(ENV['ROLES']) - [:admin]).each_with_index do |role, i|
  user2 = User.find_or_create_by_email first_name: fn[i], last_name: ln[i], email: "user#{i.to_s}@example.com", :password => 'changeme', :password_confirmation => 'changeme'
  puts 'user: ' << user2.first_name
  user2.add_role role 
end
