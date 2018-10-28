class ReservationsController < ApplicationController

    before_action :authorize
    

    def show
        @reservation = Reservation.where(user_id: current_user.id)
    end

    def new
    end

    def create
        @duty = Duty.find(params[:duty_id])
        @reserve = Reservation.new(current_user.id, duty.id)
        if @reserve.save == false
            redirect_to duties_path
            flash[:error] = "Sorry, something went wrong."
        else
            redirect_to user_path(current_user)
        end
    end

    def delete
    end

    private

end
