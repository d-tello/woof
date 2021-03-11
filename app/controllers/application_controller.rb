class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_unread_sniffs

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username photo])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username photo])
  end

  def get_unread_sniffs
    if user_signed_in? && current_user.dogs.first
      @unread_sniffs = Sniff.unread_by(current_user).where(sniffed: current_user.dogs.first)
    end
  end
end
