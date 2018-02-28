class WeatherController < ApplicationController
  include ManageCookies
  class CityNotFound < StandardError; end

  def index
    create_cookies unless cookies_exists?
    @cities = get_cookies
  end

  def get_weather
    city = weather_params[:city]

    if /^[A-Za-z ]+$/.match(city)
      add_city_to_cookies(city) unless cookies_contains?(city)
      weather = WeatherService.call(city)
      session[:weather] = weather
      redirect_to weather_details_url
    else
      flash[:alert] = "Wrong city format"
      redirect_to weather_url
    end
  end

  def details
    raise CityNotFound if session[:weather]["cod"] == "404"

    @weather = session[:weather].with_indifferent_access
    @forecast = WeatherService.call(@weather["name"], true).with_indifferent_access

  rescue CityNotFound
    flash[:alert] = "City not found"
    redirect_to weather_url
  end

  private

  def weather_params
    params.require(:weather).permit(:city)
  end
end
