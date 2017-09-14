class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  check_authorization unless: :devise_controller?
  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end
end
