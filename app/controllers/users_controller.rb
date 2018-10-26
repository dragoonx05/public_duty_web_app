class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create 
        user = User.new(signup_params)
        # user.set_driver_status

        if user.save
            flash[:notice] = "Account successfully registered!"
            redirect_to "/"
        else
            flash[:alert] = "Unable to register account, check details and retry!"
            render :new
        end 
    end
    
    private
    
    def signup_params
        params.require(:users).permit(:email, :name, :password, :ic_number, :sjam_id, :division, :phone_number, :driver_status)
    end


end
