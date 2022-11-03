module GossipsHelper
    def is_owner?
        @gossip.user == current_user
      end
    
      def authenticate_user
        unless current_user
          redirect_to new_session_path, notice: "Connecte toi s'il te plait."
        end
      end
end
