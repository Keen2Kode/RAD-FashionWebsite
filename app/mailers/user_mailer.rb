class UserMailer < ApplicationMailer
  
  def reset_password(request)
    @user = params[:user]
    
    # so a hacker can't send to a different email, check your global id, and change it
    # alternative to storing an authentication key for the user (Tute ll)
    token = @user.to_signed_global_id(purpose: "reset_password", expires_in: 30.minutes)
    cloud9_url = reset_password_url(token: token)
    heroku_url = reset_password_url(token: token, host: request.host_with_port, protocol: 'https')
    
    @url =  Rails.env.production? ? cloud9_url : heroku_url
    mail to: @user.email
  end
  
end
