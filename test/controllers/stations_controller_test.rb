require 'test_helper'

class StationsControllerTest < ActionController::TestCase
  setup do
    @station = stations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create station" do
    assert_difference('Station.count') do
      post :create, station: { call_letters: @station.call_letters, location: @station.location, station_id: @station.station_id }
    end

    assert_redirected_to station_path(assigns(:station))
  end

  test "should show station" do
    get :show, id: @station
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @station
    assert_response :success
  end

  test "should update station" do
    patch :update, id: @station, station: { call_letters: @station.call_letters, location: @station.location, station_id: @station.station_id }
    assert_redirected_to station_path(assigns(:station))
  end

  test "should destroy station" do
    assert_difference('Station.count', -1) do
      delete :destroy, id: @station
    end

    assert_redirected_to stations_path
  end

  test "should show bio" do
    get :bio, id: @station
    assert_response :success
  end

  test "should show current" do
    get :current, id: @station
    assert_response :success
  end

  test "should show library" do
    get :library, id: @station
    assert_response :success
  end

  test "should show hot tracks" do
    get :hot, id: @station
    assert_response :success
  end
end
