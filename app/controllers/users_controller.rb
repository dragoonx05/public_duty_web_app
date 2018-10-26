class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create 
        user = User.new(user_params)
        
        if user.save
            flash[:notice] = "Account successfully registered!"
            redirect to "/"
        else
            flash[:alert] = "Unable to register account, check details and retry!"
            render :new
        end 
    end
    
end
