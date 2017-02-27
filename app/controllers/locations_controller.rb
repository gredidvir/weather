class LocationsController < ApplicationController
  before_action :set_location, only: [:show]


  def index
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @city = params[:location]
      options = {units: "metric", APPID: "9bdfdb5ca9057942a607c6bf38ac0766"}
      @all_details = OpenWeather::Forecast.city(@city, options)
      if @all_details["city"]
        @weather = @all_details["list"][0]["main"]["temp"] 
        @weather_deatails = @all_details["list"][0]["weather"][0]
        @main = @weather_deatails["main"]
        @desc = @weather_deatails["description"]
        @icon = @weather_deatails["icon"]
        @city = @all_details["city"]["name"]
        @lon = @all_details["city"]["coord"]["lon"]
        @lat = @all_details["city"]["coord"]["lat"]
      else
        @error = @all_details["message"];
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:city, :temp)
    end
end
