class EcontactsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
	before_filter :mod_user,  only: [:destroy, :new, :create, :edit, :update]

	def new
		@current_event = Event.find(params[:event_id])
		@contact = Econtact.new
	end
	
	def create
		@current_event = Event.find(params[:event_id])
		@contact = @current_event.econtacts.build(params[:econtact])
    if @contact.save
      flash[:success] = "Contact added!"
      redirect_to @current_event
    else
    	render 'new'
    end
	end

	def edit
		@current_event = Event.find(params[:event_id])
		p = Econtact.find(params[:id])
    @contact = @current_event.econtacts.find_by_id(p)
	end

	def update
		@current_event = Event.find(params[:event_id])
		p = Econtact.find(params[:id])
    @contact = @current_event.econtacts.find_by_id(p)
    if @contact.update_attributes(params[:econtact])
      flash[:notice] = "Contact was updated successfully."
      redirect_to @current_event
    else
      render 'edit'
    end
	end

	def destroy
		@current_event = Event.find(params[:event_id])
		p = Econtact.find(params[:id])
    @current_event.econtacts.find_by_id(p).destroy
    flash[:success] = "Contact deleted."
    redirect_to @current_event
	end
end
