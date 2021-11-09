class EventController < ApplicationController
 
  def index
    # @all_events_array = Event.all 
    # events apparaissent par ordre de création

    @all_events_array = Event.order(:start_date)
    # events apparaissent par ordre de start_date (attribut) imminente


    render :index
  end


end
