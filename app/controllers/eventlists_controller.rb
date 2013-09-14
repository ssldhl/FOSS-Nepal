class EventlistsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
	before_filter :mod_user,  only: [:destroy, :new, :create, :edit, :update]

	def new
		@current_event = Event.find(params[:event_id])
		@list = Eventlist.new
	end
	
	def create
		@current_event = Event.find(params[:event_id])
		@list = @current_event.eventlists.build(params[:eventlist])
    if @list.save
      flash[:success] = "Event added!"
      redirect_to @current_event
    else
    	render 'new'
    end
	end

	def edit
		@current_event = Event.find(params[:event_id])
		p = Eventlist.find(params[:id])
    @list = @current_event.eventlists.find_by_id(p)
	end

	def update
		@current_event = Event.find(params[:event_id])
		p = Eventlist.find(params[:id])
    @list = @current_event.eventlists.find_by_id(p)
    if @list.update_attributes(params[:eventlist])
      flash[:notice] = "Event was updated successfully."
      redirect_to @current_event
    else
      render 'edit'
    end
	end

	def destroy
		@current_event = Event.find(params[:event_id])
		p = Eventlist.find(params[:id])
    @current_event.eventlists.find_by_id(p).destroy
    flash[:success] = "Event deleted."
    redirect_to @current_event
	end
end
