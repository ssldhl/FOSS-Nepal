class OutcomesController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]

	def new
		@current_meeting = Meeting.find(params[:meeting_id])
    if @current_meeting.outcome
    	flash[:success] = "This meeting already has the outcomes!"
      redirect_to @current_meeting
    else    	
			@outcome = Outcome.new
		end
	end

	def create
		@current_meeting = Meeting.find(params[:meeting_id])
  	@outcome = @current_meeting.build_outcome(params[:outcome])
    if @outcome.save
      flash[:success] = "Outcome created!"
      redirect_to @current_meeting
    else
      render 'new'
    end
  end

  def edit
    @current_meeting = Meeting.find(params[:meeting_id]) 
    @outcome = @current_meeting.outcome
  end

  def update
    @current_meeting = Meeting.find(params[:meeting_id]) 
    @outcome = @current_meeting.outcome
    if @outcome.update_attributes(params[:outcome])
      flash[:notice] = "Outcome was updated successfully."
      redirect_to @current_meeting
    else
      render 'edit'
    end
 	end 

  def destroy
    @current_meeting = Meeting.find(params[:meeting_id])
    @current_meeting.outcome.destroy
    flash[:success] = "Outcome deleted."
    redirect_to @current_meeting
  end
end
