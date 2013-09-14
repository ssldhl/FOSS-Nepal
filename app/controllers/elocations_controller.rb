class ElocationsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :mod_user,  only: [ :destroy, :new, :create, :edit, :update]

	def new
		@current_event = Event.find(params[:event_id])
    if @current_event.elocation
    	flash[:success] = "This Event already has the location!"
      redirect_to @current_event
    else    	
			@location = Elocation.new
      @json = @location.to_gmaps4rails
		end
	end

	def create
		@current_event = Event.find(params[:event_id])
  	@location = @current_event.build_elocation(params[:elocation])
    if @location.save
      flash[:success] = "Location created!"
      redirect_to @current_event
    else
      render 'new'
    end
  end

  def edit
    @current_event = Event.find(params[:event_id]) 
    @location = @current_event.elocation
    @json = @location.to_gmaps4rails
  end

  def update
    @current_event = Event.find(params[:event_id]) 
    @location = @current_event.elocation
    if @location.update_attributes(params[:elocation])
      flash[:notice] = "Location was updated successfully."
      redirect_to @current_event
    else
      render 'edit'
    end
 	end 

  def destroy
    @current_event = Event.find(params[:event_id])
    @current_event.elocation.destroy
    flash[:success] = "Location deleted."
    redirect_to @current_event
  end
end
