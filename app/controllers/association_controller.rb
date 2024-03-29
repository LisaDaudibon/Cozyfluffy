class AssociationController < ApplicationController
  before_action :is_admin?, only: %i[ new create edit update destroy ]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.user_id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to association_index_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to association_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to association_index_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :date, :description) 
  end
end
