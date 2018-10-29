class DutiesController < ApplicationController
    
    before_action :authorize
    
    def index
        # @duties = Duty.all
        @duties = Duty.where(nil)
        @searched_results = @duties.filter(filtering_params(params))
    
        # @duties = @duties.duty_name(params[:search][:duty_name]) if params[:search] && params[:search][:duty_name].present?
        # @duties = @duties.duty_name(params[:search][:venue]) if params[:search] && params[:search][:venue].present?

    end
    
    
    def new
        @duty = Duty.new
    end

    def create
        duty = Duty.new(duty_params)
        duty.created_by = current_user.id
        if duty.save
            flash[:notice] = "Duty successfully registered!"
            redirect_to duties_path
            # --- activate only when it is ready ---
            # redirect_to duty_path(duty)
        else
            flash[:alert] = "Unable to register duty, check details and retry!"
            render :new
        end 
    end


    def show
        @duty = Duty.find(params[:id])
        @reservation = Reservation.where(duty_id: @duty.id)
    end

    def edit
        @duty = Duty.find(params[:id])
    end

    def update
        duty = Duty.find(params[:id])
        duty.update(duty_params)
        redirect_to duties_path(duty)
    end

    def destroy
        duty = Duty.find(params[:id])
        duty.destroy
        redirect_to duties_path
    end

    def ajax_search
        @duties = Duty.all
        @duties = Duty.search_fields(params[:search_fields]).pluck(:duty_name).uniq
        respond_to do |format| #collect data and save as string
            format.json {render json: @duties}
            format.json
        end
    end

    private
    
    def duty_params
        params.require(:duty).permit(:duty_name, :venue, :start_date_time, :end_date_time, :contact_person, :contact_number)
    end

    def filtering_params(params)
        params.slice(:search_fields)
    end

end
