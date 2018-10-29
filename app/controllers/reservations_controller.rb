class ReservationsController < ApplicationController

    before_action :authorize
    
    def index
        @reservations = Reservation.where(user_id: current_user.id)
    end

    def show
        @reservation = Reservation.where(duty_id: @reservation.duty_id)
    end

    def new
    end

    def create
        @duty = Duty.find(params[:duty_id])
        @reserve = Reservation.new
        @reserve.user_id = current_user.id
        @reserve.duty_id = @duty.id
        if @reserve.save == false
            redirect_to root_path
            flash[:error] = "Sorry, something went wrong."
        else
            # Twilio::REST::Client.new.messages.create({
            #     from: ENV['twilio_phone_number'],
            #     to: ENV['my_number'],
            #     body: "You have booked the duty '#{@duty.duty_name}' and be ready 1 hour before #{@duty.start_date_time}. Thank you for volunteering!"
            # })
            redirect_to user_path(current_user)
        end
    end

    def ajax_button
        
    end

    def delete
    end

    private

end
