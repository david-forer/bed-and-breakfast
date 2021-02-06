class ApplicationController < ActionController::API
include ::ActionController::Cookies

def current_user
    User.find_by(id: session[:user_id])
#     @_current_user ||= session[:current_user_id] &&
#       User.find_by(id: session[:current_user_id])
end

def logged_in?
    !!current_user
end

end
