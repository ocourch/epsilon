require 'test_helper'

class StationAlbumsControllerTest < ActionController::TestCase
  setup do
    @station_album = station_albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:station_albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create station_album" do
    assert_difference('StationAlbum.count') do
      post :create, station_album: { album_id: @station_album.album_id, station_id: @station_album.station_id }
    end

    assert_redirected_to station_album_path(assigns(:station_album))
  end

  test "should show station_album" do
    get :show, id: @station_album
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @station_album
    assert_response :success
  end

  test "should update station_album" do
    patch :update, id: @station_album, station_album: { album_id: @station_album.album_id, station_id: @station_album.station_id }
    assert_redirected_to station_album_path(assigns(:station_album))
  end

  test "should destroy station_album" do
    assert_difference('StationAlbum.count', -1) do
      delete :destroy, id: @station_album
    end

    assert_redirected_to station_albums_path
  end
end
