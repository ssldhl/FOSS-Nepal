class LocationsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :mod_user,  only: [ :destroy, :new, :create, :edit, :update]

	def new
		@current_meeting = Meeting.find(params[:meeting_id])
    if @current_meeting.location
    	flash[:success] = "This meeting already has the location!"
      redirect_to @current_meeting
    else    	
			@location = Location.new
      @json = @location.to_gmaps4rails
		end
	end

	def create
		@current_meeting = Meeting.find(params[:meeting_id])
  	@location = @current_meeting.build_location(params[:location])
    if @location.save
      flash[:success] = "Location created!"
      redirect_to @current_meeting
    else
      render 'new'
    end
  end

  def edit
    @current_meeting = Meeting.find(params[:meeting_id]) 
    @location = @current_meeting.location
    @json = @location.to_gmaps4rails
  end

  def update
    @current_meeting = Meeting.find(params[:meeting_id]) 
    @location = @current_meeting.location
    if @location.update_attributes(params[:location])
      flash[:notice] = "Location was updated successfully."
      redirect_to @current_meeting
    else
      render 'edit'
    end
 	end 

  def destroy
    @current_meeting = Meeting.find(params[:meeting_id])
    @current_meeting.location.destroy
    flash[:success] = "Location deleted."
    redirect_to @current_meeting
  end
end
