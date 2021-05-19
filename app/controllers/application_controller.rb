class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include UsersHelper
    
    def default_url_options
        { host: request.host_with_port }
    end
end
