class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def signed_in?
        !current_user.nil?
    end

    def authorize
        redirect_to "/login" unless current_user
    end

    # a convenient method to set the session to given user's id with the `:user_id` key
    def sign_in(user)
        session[:user_id] = user.id
    end

    # clears the session by setting the value of `:user_id` key to `nil`
    def sign_out
        session[:user_id] = nil
    end
end


