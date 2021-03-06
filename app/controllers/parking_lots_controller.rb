class ParkingLotsController < ApplicationController
  def index
    @parking_lots = ParkingLot.search(params[:search])
    counter = 0
    @json = @parking_lots.to_gmaps4rails do |parking, marker|
      counter += 1
      marker.infowindow "<b>#{parking.address}</b><br><a href=\"parking_lots/#{parking.id}\">Reservar vaga.</a>"
      marker.picture({
                  :picture => "assets/number_#{counter}.png",
                  :width   => 32,
                  :height  => 37
                 })
      marker.title(parking.address)
    end
  end

  def show
    @parking_lot = ParkingLot.find(params[:id])
    @json = @parking_lot.to_gmaps4rails
    @free_spots = ((100.0*@parking_lot.spots_current) / @parking_lot.spots_total).to_i
  end

  def new
    @parking_lot = ParkingLot.new
  end

  def create
    @parking_lot = ParkingLot.new(params[:parking_lot])
    if @parking_lot.save
      redirect_to @parking_lot, :notice => "Successfully created parking lot."
    else
      render :action => 'new'
    end
  end

  def edit
    @parking_lot = ParkingLot.find(params[:id])
  end

  def update
    @parking_lot = ParkingLot.find(params[:id])
    if @parking_lot.update_attributes(params[:parking_lot])
      redirect_to @parking_lot, :notice  => "Successfully updated parking lot."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @parking_lot = ParkingLot.find(params[:id])
    @parking_lot.destroy
    redirect_to parking_lots_url, :notice => "Successfully destroyed parking lot."
  end

  def dashboard    
    if current_user.has_role? :admin
      @parking_lots = ParkingLot.all
      @role = 'Admin'
    elsif current_user.has_role? :cashier
      @parking_lots = current_user.parking_lots.first
      @role = 'Caixa'
    elsif current_user.has_role? :owner
      @parking_lots = current_user.parking_lots
      @role = 'Dono'
    end  
  end
end
