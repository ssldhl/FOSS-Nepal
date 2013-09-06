class ParticipantsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
	before_filter :mod_user,  only: [ :destroy, :new, :create, :edit, :update]

	def new
		@current_meeting = Meeting.find(params[:meeting_id])
		@participant = Participant.new
	end
	
	def create
		@current_meeting = Meeting.find(params[:meeting_id])
		@participant = @current_meeting.participants.build(params[:participant])
    if @participant.save
      flash[:success] = "Participant created!"
      redirect_to @current_meeting
    else
    	render 'new'
    end
	end

	def edit
		@current_meeting = Meeting.find(params[:meeting_id])
		p = Participant.find(params[:id])
    @participant = @current_meeting.participants.find_by_id(p)
	end

	def update
		@current_meeting = Meeting.find(params[:meeting_id])
		p = Participant.find(params[:id])
    @participant = @current_meeting.participants.find_by_id(p)
    if @participant.update_attributes(params[:participant])
      flash[:notice] = "Participant was updated successfully."
      redirect_to @current_meeting
    else
      render 'edit'
    end
	end

	def destroy
		@current_meeting = Meeting.find(params[:meeting_id])
		p = Participant.find(params[:id])
    @current_meeting.participants.find_by_id(p).destroy
    flash[:success] = "Participant deleted."
    redirect_to @current_meeting
	end
end
