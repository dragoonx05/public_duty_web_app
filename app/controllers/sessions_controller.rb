class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email(params[:login][:email])
        # if the user exists and the password entered is correct
        if user && user.authenticate(params[:login][:password])
            #save the user id inside the browswer cookie, keep the user logged in when they navigate my website
            session[:user_id] = user.id
            redirect_to "/"
        else
            # if user's login doesn't work, send them back to the login form
            redirect_to "/login"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to "/"
    end

end
