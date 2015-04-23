class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
    #csv 
    @played = []
    Station.first.users.each do |u|
      u.playlists.where("updated_at > ?", Date.today).each do |p|
          @played << p
      end
    end

    @data = Hash.new
    counter = 0
    if !@played.empty?
      @played.each do |pl|
        b1 = pl.updated_at.to_s.split("-")
        b2 = b1[2].split(" ")
        b3 = b2[1].split(":")
        start_time = Time.new(b1[0], b1[1], b2[0], b3[0], b3[1], b3[2], "+00:00")

        pl.songs.each do |s|
          s.updated_at = start_time
          @data[counter] = s
          counter += 1
          start_time = start_time + s.duration
        end
      end
    end   
    
    respond_to do |format|
      format.html
      f = Time.now.to_s.truncate(10, omission: "")
      format.csv { send_data Song.to_csv(@data), filename:"Station Report #{f}.csv" }
    end
  
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
     redirect_to "/" 
  end

  # GET /stations/new
  def new
    @station = Station.new
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_url, notice: 'Station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:call_letters, :location, :station_id)
    end
end
