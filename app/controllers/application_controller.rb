class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # Can't verify CSRF token authenticity (error)
  # protect_from_forgery with: :null_session

  # protect_from_forgery with: :exception
  respond_to :json
end
