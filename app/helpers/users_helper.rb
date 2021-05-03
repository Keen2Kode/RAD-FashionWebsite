module UsersHelper
    def gravatar_for(user, size: 50)
        gravatar_id = Digest::MD5::hexdigest(user.email)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
    
    def log_in(user)
        session[:user_id] = user.id
    end
    
    def logged_in?(user)
        # logger.info "the current user has an id of #{current_user ? "nothing." : current_user.id}"
        user && current_user && current_user.id == user.id
    end
    
    def current_user
        if session[:user_id]
            # @current_user ||= User.find_by(id: session[:user_id])
            @current_user ||= User.find(session[:user_id])
        end
    end
    
    def log_out(user)
        session.delete(:user_id)
        @current_user = nil
    end
end

