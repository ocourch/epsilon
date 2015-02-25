class FeaturedArtistsController < ApplicationController
  before_action :set_featured_artist, only: [:show, :edit, :update, :destroy]

  # GET /featured_artists
  # GET /featured_artists.json
  def index
    @featured_artists = FeaturedArtist.all
  end

  # GET /featured_artists/1
  # GET /featured_artists/1.json
  def show
  end

  # GET /featured_artists/new
  def new
    @featured_artist = FeaturedArtist.new
  end

  # GET /featured_artists/1/edit
  def edit
  end

  # POST /featured_artists
  # POST /featured_artists.json
  def create
    @featured_artist = FeaturedArtist.new(featured_artist_params)

    respond_to do |format|
      if @featured_artist.save
        format.html { redirect_to @featured_artist, notice: 'Featured artist was successfully created.' }
        format.json { render :show, status: :created, location: @featured_artist }
      else
        format.html { render :new }
        format.json { render json: @featured_artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /featured_artists/1
  # PATCH/PUT /featured_artists/1.json
  def update
    respond_to do |format|
      if @featured_artist.update(featured_artist_params)
        format.html { redirect_to @featured_artist, notice: 'Featured artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @featured_artist }
      else
        format.html { render :edit }
        format.json { render json: @featured_artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /featured_artists/1
  # DELETE /featured_artists/1.json
  def destroy
    @featured_artist.destroy
    respond_to do |format|
      format.html { redirect_to featured_artists_url, notice: 'Featured artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_featured_artist
      @featured_artist = FeaturedArtist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def featured_artist_params
      params.require(:featured_artist).permit(:artist_id, :song_id)
    end
end
