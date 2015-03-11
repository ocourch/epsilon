class StationAlbumsController < ApplicationController
  before_action :set_station_album, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @station_albums = StationAlbum.all
    respond_with(@station_albums)
  end

  def show
    respond_with(@station_album)
  end

  def new
    @station_album = StationAlbum.new
    respond_with(@station_album)
  end

  def edit
  end

  def create
    @station_album = StationAlbum.new(station_album_params)
    @station_album.save
    respond_with(@station_album)
  end

  def update
    @station_album.update(station_album_params)
    respond_with(@station_album)
  end

  def destroy
    @station_album.destroy
    respond_with(@station_album)
  end

  private
    def set_station_album
      @station_album = StationAlbum.find(params[:id])
    end

    def station_album_params
      params.require(:station_album).permit(:station_id, :album_id)
    end
end
