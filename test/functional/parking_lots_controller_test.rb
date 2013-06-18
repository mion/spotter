require 'test_helper'

class ParkingLotsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ParkingLot.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ParkingLot.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ParkingLot.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to parking_lot_url(assigns(:parking_lot))
  end

  def test_edit
    get :edit, :id => ParkingLot.first
    assert_template 'edit'
  end

  def test_update_invalid
    ParkingLot.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ParkingLot.first
    assert_template 'edit'
  end

  def test_update_valid
    ParkingLot.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ParkingLot.first
    assert_redirected_to parking_lot_url(assigns(:parking_lot))
  end

  def test_destroy
    parking_lot = ParkingLot.first
    delete :destroy, :id => parking_lot
    assert_redirected_to parking_lots_url
    assert !ParkingLot.exists?(parking_lot.id)
  end
end
