puts 'Creating roles...'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'Role created: ' << role
end

users = {
  admin: {fn: 'Gabriel', ln: 'Vieira'},
  user: {fn: 'John', ln: 'Doe'},
  cashier: {fn: 'Bob', ln: 'Smith'},
  owner: {fn: 'Mary', ln: 'Jane'},
}

puts 'Creating default users...'
users.each do |role, info|
  user = User.find_or_create_by_email(first_name: info[:fn], 
                                       last_name: info[:ln], 
                                       email: "#{role}@example.com", 
                                       password: "#{role}1234", 
                                       password_confirmation: "#{role}1234") 
  user.add_role(role)
  user.save!
  puts "Created user: #{user.to_s}"
  users[role] = user
end

# admin = User.find_or_create_by_email(first_name: 'Gabriel', last_name: 'Vieira', email: 'admin@example.com', password: 'admin', password_confirmation: 'admin')
# admin.add_role :admin
# puts 'Created admin: ' << admin.first_name

# cashier = User.find_or_create_by_email(first_name: 'John', last_name: 'Smith', email: 'cashier@example.com', password: 'cashier', password_confirmation: 'cashier')
# cashier.add_role :cashier
addresses = [
  "Rua Visc. de Pirajá, 152 - Ipanema",
  "Largo do Machado, 54 - Catete",
  "Rua Visc. de Pirajá, 250 - Ipanema",
  "Rua Pacheco Leão, 70 - Jardim Botânico",
  "Rua Visc. Pirajá, 142 - Ipanema",
  "Rua Xavier da Silveira, 58 - Copacabana",
  "Rua Visc. de Ouro Preto, 5 e Praia de Botafogo, 348 - Botafogo",
  "Rua Visc. de Pirajá, 547 - Ipanema",
  "Praia de Botafogo, 501 - Botafogo",
  "Rua Dias Ferreira, 190 - Leblon",
  "Rua Dona Mariana, 143 - Botafogo",
  "Rua Afrânio M. Franco, 141 - Leblon",
  "Rua do Catete, 311 - Largo do Machado",
  "Rua General Polidóro, 201 - Botafogo",
  "Rua General Polidóro, 250 - Botafogo",
  "Rua Jardim Botânico, 97 - Jardim Botânico",
  "Rua Jardim Botânico, 266 - Jardim Botânico",
  "Aterro do Flamengo S/N - Glória",
  "Rua Barata Ribeiro, 222 - Copacabana",
  "Av. Ataulfo de Paiva, 1.100 - Ataulfo Corporate - Leblon",
  "Rua Prudente de Morais, 1.597 - Ipanema",
  "Rua Garcia Dávila, 114, Ipanema - Rio de Janeiro",
  "Rua Jardim Botânico, 705, Jd. Botânico - Rio de Janeiro",
  "Rua Farme de Amoedo, 86, Ipanema",
  "Praia do Flamengo, 200 - Flamengo",
  "Rua Ataulfo de Paiva, 153 - Leblon",
  "Rua Bartolomeu Mitre, 770 - Leblon",
  "Rua Bambina 98 - Botafogo",
  "Rua Bartolomeu Mitre, 770 - leblon",
  "Rua Muniz Barreto, 100 - Botafogo",
  "Rua do Russel, 744/766/804 - Glória - RJ"
]

puts 'Creating parking lots...'
addresses.each do |address|
  pr0 = (500 + Random.rand(1500)) / 100.0
  pr1 = (500 + Random.rand(1500)) / 100.0  
  hr = 7 + Random.rand(10)
  a0 = [0, hr]
  a1 = [hr + 1, 23]
  pricing = {a0 => pr0, a1 => pr1}
  p = users[:owner].parking_lots.create(address: address, 
                                     spots_total: 15 + Random.rand(20),
                                     pricing: pricing.to_json,
                                     schedule: "{}") 
  puts "Created parking lot: #{p.to_s}"
end

# users[:owner].parking_lots.create(address: "Rua Falsa, 123 - Bairro Mentira", spots_total: 50, pricing: '{"seg-sab": {"7-12": 15.90, "13-23": 22.90}}', schedule: '{"seg-sab": "7-23"}')
# users[:owner].parking_lots.create(address: "Av. Qualquer, 45 - XPTOlandia", spots_total: 50, pricing: '{"ter-sex": {"6-20": 14.0}}', schedule: '{"seg-sex": "6-18"}')

# fn = ["John", "Jack", "Jane"]
# ln = ["Smith", "Souza", "Doe"]
# (YAML.load(ENV['ROLES']) - [:admin]).each_with_index do |role, i|
#   user2 = User.find_or_create_by_email first_name: fn[i], last_name: ln[i], email: "user#{i.to_s}@example.com", :password => 'changeme', :password_confirmation => 'changeme'
#   puts 'user: ' << user2.first_name
#   user2.add_role role 
# end

