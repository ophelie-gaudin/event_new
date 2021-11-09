class UserController < ApplicationController

def show
  @user = current_user    
  @user_first_name = @user.first_name
  @user_last_name = @user.last_name
  @user_description = @user.description
  @user_email = @user.email
end

def update
  unless current_user
    redirect_to session_new_path
  else
    @user = User.find(params[:id])

    puts "#################################"
    puts @user
    puts "#################################"



    user_params = params.permit(:first_name, :last_name, :description)
    # Pour valider les infos (sinon pas permis par Ruby)
    # require : permet de vérifier qu'une info est présente et la renvoie
    #permit: autoriser les informations pour qu'elles passent

    if @user.update(first_name: user_params["first_name"], last_name: user_params["last_name"], description: user_params["description"])
      redirect_to user_path, alert: "Your resume is saved!"
    else
      render 'edit', alert: "Oops! There was a problem, please try again"
    end

      
    # Méthode qui met à jour le'user à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
end
end 

end
