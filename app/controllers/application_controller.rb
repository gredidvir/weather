class ApplicationController < ActionController::Base
  require 'open_weather'
  protect_from_forgery with: :exception
end
