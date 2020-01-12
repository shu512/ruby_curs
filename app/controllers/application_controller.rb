class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path, alert: '403 Forbidden'
  end
end
