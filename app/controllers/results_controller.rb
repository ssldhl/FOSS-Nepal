class ResultsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :mod_user,  only: [ :destroy, :new, :create, :edit, :update]

	def new
		@current_event = Event.find(params[:event_id])
    if @current_event.result
    	flash[:success] = "This meeting already has the descriptions!"
      redirect_to @current_event
    else    	
			@result = Result.new
		end
	end

	def create
		@current_event = Event.find(params[:event_id])
  	@result = @current_event.build_result(params[:result])
    if @result.save
      flash[:success] = "Result created!"
      redirect_to @current_event
    else
      render 'new'
    end
  end

  def edit
    @current_event = Event.find(params[:event_id]) 
    @result = @current_event.result
  end

  def update
    @current_event = Event.find(params[:event_id]) 
    @result = @current_event.result
    if @result.update_attributes(params[:result])
      flash[:notice] = "Result was updated successfully."
      redirect_to @current_event
    else
      render 'edit'
    end
 	end 

  def destroy
    @current_event = Event.find(params[:event_id])
    @current_event.result.destroy
    flash[:success] = "Result deleted."
    redirect_to @current_event
  end
end
