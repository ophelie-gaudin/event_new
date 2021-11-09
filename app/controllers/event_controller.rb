class EventController < ApplicationController
 
  def index
    # @all_events_array = Event.all 
    # events apparaissent par ordre de création

    @all_events_array = Event.order(:start_date)
    # events apparaissent par ordre de start_date (attribut) imminente


    render :index
  end

  def new
    @event = Event.new(title: "", description: "", admin_id: current_user.id)

    puts "________________________________________"
    puts "NNNNEEEEWWWW"
    puts "________________________________________"
    # Méthode qui crée un event vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)

  end

  def create
    puts "On rentre dans CREATE"
    @title = params[:event][:event_title]
    @description = params[:event][:event_description] 
    @event = Event.new(
      title: params[:event][:event_title], 
      description: params[:event][:event_description],
      start_date:  params[:event][:event_start_date],
      duration: params[:event][:event_duration].to_i,
      price: params[:event][:event_price],
      location: params[:event][:event_location].to_s,
      admin_id: current_user.id
      )

      
      if @event.save # essaie de sauvegarder en base @gossip
          redirect_to "/"
      
      else
        puts "JE RESTE SUR LA PAGE"
        render new_event_path
        
        #render new_gossip_path(@gossip)  
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      end
    
  end

end
