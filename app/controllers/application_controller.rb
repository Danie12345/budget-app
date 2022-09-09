require 'net/http'
require 'open-uri'
require 'faraday'

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  def image_exists?(url_string)
    return false unless url_exists?(url_string)

    response = {}
    uri = URI(url_string)
    begin
      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        request = Net::HTTP::Get.new uri
        response = http.request request # Net::HTTPResponse object
      end
      response.content_type.starts_with?('image')
    rescue StandardError
      false
    end
  end

  def url_exists?(url)
    Faraday.get(url).status
  rescue StandardError
    false
  end

  private

  # Set client
  def set_client
    @client = current_user
  end

  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
