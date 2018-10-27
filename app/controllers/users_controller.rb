class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create 
        user = User.new(signup_params)
        user.role = "Member" # default role is member, only admin is appointed and pdc and cvsc is appointed by admin
        if user.save
            session[:user_id] = user.id
            flash[:notice] = "Account successfully registered!"
            redirect_to "/"
        else
            flash[:alert] = "Unable to register account, check details and retry!"
            render :new
        end 
    end
    
    # def default_role
    #     user_role = User.
    # end

    private
    
    def signup_params
        params.require(:users).permit(:email, :name, :password, :ic_number, :sjam_id, :division, :phone_number, :driver_status)
    end


end
