class ParkingLotsController < ApplicationController
  def index
    @parking_lots = ParkingLot.search(params[:search])
  end

  def show
    @parking_lot = ParkingLot.find(params[:id])
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
end
