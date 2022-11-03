class SessionsController < ApplicationController
    def new
        @sessions = Sessions.new
      end

    def create
        # cherche s'il existe un utilisateur en base avec l’e-mail
        user = User.find_by(email: email_dans_ton_params)
  
        # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
        if user && user.authenticate(password_dans_ton_params)
          session[:user_id] = user.id
          # redirige où tu veux, avec un flash ou pas
  
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
    end

    def destroy
        @session.destroy
    
        respond_to do |format|
          format.html { redirect_to root, notice: "Comment was successfully destroyed." }
          format.json { head :no_content }
        end
    end

end
