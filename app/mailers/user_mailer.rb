class UserMailer < ApplicationMailer
# need to set up default_url_options = {host: "url.com"}
# but it changes depending on who uses it
# this is why ActionController has default_url_options method to dynamically set the email domain

  # def default_url_options
  #   { host: "https://257e557ba36343949ed1801d78c2d064.vfs.cloud9.us-east-2.amazonaws.com" }
  # end
  
  def reset_password(request)
    @user = params[:user]
    # so a hacker can't send to a different email, check your global id, and change it
    @reset_token = @user.to_signed_global_id(purpose: "reset_password", expires_in: 30.minutes)
    # @url  = reset_password_url(token: @reset_token, host: request.host_with_port, protocol: 'https')
    @url = reset_password_url(token: @reset_token)
    mail to: @user.email
  end
  
end
