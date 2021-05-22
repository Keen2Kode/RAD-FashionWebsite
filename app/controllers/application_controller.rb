class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include UsersHelper
    include SavedHelper
    
    helper_method :saved
    
    def saved
        db_saved = current_user.saved_items.map(&:item_id) if logged_in?
        logged_in? ? db_saved : cookies_saved
    end
end
