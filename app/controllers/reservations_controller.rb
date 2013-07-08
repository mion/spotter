class ReservationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params[:reservation])
    @reservation.user_id = current_user.id
    @reservation.price = 
    if @reservation.save
      redirect_to @reservation, :notice => "Successfully created reservation."
    else
      render :action => 'new'
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(params[:reservation])
      redirect_to @reservation, :notice  => "Successfully updated reservation."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_url, :notice => "Successfully destroyed reservation."
  end
end
