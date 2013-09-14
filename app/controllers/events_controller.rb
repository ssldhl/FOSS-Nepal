class EventsController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update, :destroy, :new, :create]
	before_filter :mod_user,  only: [ :destroy, :new, :create, :edit, :update]
	def show
		@event = Event.find(params[:id])
		@results = @event.result
		@sno = 1
		@list = @event.eventlists.build if signed_in?
		@lists = @event.eventlists.all
		@serial = 1
		@contact = @event.econtacts.build if signed_in?
		@contacts = @event.econtacts.order("name").all
		@locations = @event.elocation
		if @locations
			@json = @locations.to_gmaps4rails do |location, marker|
  						marker.infowindow render_to_string(:partial => "/shared/infowindow", :locals => { :location => location})
    					marker.title "#{@event.name}"
    	end
   	end
	end

	def index
		@events = Event.paginate(page: params[:page])
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event])
		if @event.save
			flash[:success] = "Event created successfully!"
      redirect_to @event
    else
    	render 'new'
    end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(params[:event])
			flash[:success] = "Event updated"
      redirect_to @event
    else
    	render 'edit'
    end
	end

	def destroy
		Event.find(params[:id]).destroy
		flash[:success] = "Event deleted."
    redirect_to events_url
	end
end
