require 'test_helper'

class FeaturedArtistsControllerTest < ActionController::TestCase
  setup do
    @featured_artist = featured_artists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:featured_artists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create featured_artist" do
    assert_difference('FeaturedArtist.count') do
      post :create, featured_artist: { artist_id: @featured_artist.artist_id, song_id: @featured_artist.song_id }
    end

    assert_redirected_to featured_artist_path(assigns(:featured_artist))
  end

  test "should show featured_artist" do
    get :show, id: @featured_artist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @featured_artist
    assert_response :success
  end

  test "should update featured_artist" do
    patch :update, id: @featured_artist, featured_artist: { artist_id: @featured_artist.artist_id, song_id: @featured_artist.song_id }
    assert_redirected_to featured_artist_path(assigns(:featured_artist))
  end

  test "should destroy featured_artist" do
    assert_difference('FeaturedArtist.count', -1) do
      delete :destroy, id: @featured_artist
    end

    assert_redirected_to featured_artists_path
  end
end
