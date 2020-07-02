class StaticPagesController < ApplicationController
  def home
  end

  def current
    if Rails.cache.read(request.env['ORIGINAL_FULLPATH'])
      @response = Rails.cache.read(request.env['ORIGINAL_FULLPATH'])
      @cached = true
    else
      base_url = "https://api.weatherbit.io/v2.0/current"
      city = "?city=#{params[:city]}"
      state = ",#{params[:state]}"
      key = "&key=#{ENV["WEATHER_KEY"]}"
      zip = "?postal_code=#{params[:zip]}&country=US"

      if params.include? :zip
        Rails.cache.fetch(request.env['ORIGINAL_FULLPATH'], :expires_in => 30.minutes) do
          @response = HTTParty.get(base_url + zip + key)
        end
      else
        Rails.cache.fetch(request.env['ORIGINAL_FULLPATH'], :expires_in => 30.minutes) do
          @response = HTTParty.get(base_url + city + state + key)
        end
      end

    end

  end

  def forecast
    if Rails.cache.read(request.env['ORIGINAL_FULLPATH'])
      @response = Rails.cache.read(request.env['ORIGINAL_FULLPATH'])
      @cached = true
    else
      Rails.cache.fetch(request.env['ORIGINAL_FULLPATH'], :expires_in => 30.minutes) do
        base_url = "https://api.weatherbit.io/v2.0/forecast/hourly"
        zip = "?postal_code=#{params[:zip]}&country=US"
        @response = HTTParty.get(base_url + zip + "&key=#{ENV["WEATHER_KEY"]}&hours=48")
      end
    end
  end
end
