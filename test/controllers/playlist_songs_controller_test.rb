require 'test_helper'

class PlaylistSongsControllerTest < ActionController::TestCase
  setup do
    @playlist_song = playlist_songs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playlist_songs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playlist_song" do
    assert_difference('PlaylistSong.count') do
      post :create, playlist_song: { playlist_id: @playlist_song.playlist_id, song_id: @playlist_song.song_id }
    end

    assert_redirected_to playlist_song_path(assigns(:playlist_song))
  end

  test "should show playlist_song" do
    get :show, id: @playlist_song
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @playlist_song
    assert_response :success
  end

  test "should update playlist_song" do
    patch :update, id: @playlist_song, playlist_song: { playlist_id: @playlist_song.playlist_id, song_id: @playlist_song.song_id }
    assert_redirected_to playlist_song_path(assigns(:playlist_song))
  end

  test "should destroy playlist_song" do
    assert_difference('PlaylistSong.count', -1) do
      delete :destroy, id: @playlist_song
    end

    assert_redirected_to playlist_songs_path
  end
end
