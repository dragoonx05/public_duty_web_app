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

    # create session with google omniauth
    def create_from_omniauth
        auth_hash = request.env["omniauth.auth"]
        authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)

        # if: previously already logged in with OAuth
        if authentication.user
            user = authentication.user
            authentication.update_token(auth_hash)
            @next = root_url
            @notice = "Signed in!"
        # else: user logs in with OAuth for the first time
        else
            user = User.create_with_auth_and_hash(authentication, auth_hash)
            # you are expected to have a path that leads to a page for editing user details
            @next = edit_user_path(user)
            @notice = "User created. Please confirm or edit details"
        end

        sign_in(user)
        redirect_to @next, :notice => @notice
    end

    def destroy
        session[:user_id] = nil
        redirect_to "/"
    end

end
