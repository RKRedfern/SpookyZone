class ApplicationController < ActionController::Base
helper_method :current_user, :logged_in?

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
        #if current user is already defined then it will = current_user otherwise it will find_by_id in the users table
        #also if you name this @user it could potentially override other instance variables
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end
end
