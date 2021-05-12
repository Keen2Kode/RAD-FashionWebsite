module UsersHelper
    def gravatar_for(user, size: 50)
        gravatar_id = Digest::MD5::hexdigest(user.email)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
    
    
    
    
    def log_in(user)
        session[:user_id] = user.id
    end
    
    def logged_in?(user = nil)
        current_user && (user ? current_user.id == user.id : true)
    end
    
    def current_user
        if session[:user_id]
            # don't throw exception so use find_by
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end
    
    def log_out(user)
        session.delete(:user_id)
        @current_user = nil
    end
    
    
    # Since we need to redirect back two pages, redirect_back isn't useful here
    # additionally request.referer isn't set if you redirect without landing on the page eg: bag_items#create 
    def back_path
        session[:back_path] || current_user || root_path
    end
    
    def set_back_path(path)
        session[:back_path] = path
    end
end

