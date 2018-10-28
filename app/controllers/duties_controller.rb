class DutiesController < ApplicationController

    before_action :authorize
    
    def new
        @duty = Duty.new
    end

    def create
        duty = Duty.new(new_duty_params)
        duty.user_id = current_user.id
        if duty.save
            flash[:notice] = "Duty successfully registered!"
            redirect_to duties_path
        else
            flash[:alert] = "Unable to register duty, check details and retry!"
            render :new
        end 
    end

    def edit
    end

    def delete
    end

    private
    
    def new_duty_params
        params.require(:duty).permit(:duty_name, :venue, :start_date_time, :end_date_time, :contact_person, :contact_number)
    end

end
