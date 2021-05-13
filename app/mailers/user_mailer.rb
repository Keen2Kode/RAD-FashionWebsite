class UserMailer < ApplicationMailer


  # TODO: complete so host url works on other systems AND all environment
  def default_url_options
    { host: "https://257e557ba36343949ed1801d78c2d064.vfs.cloud9.us-east-2.amazonaws.com" }
  end
  
  def reset_password
    @user = params[:user]
    # so a hacker can't send to a different email, check your global id, and change it
    @reset_token = @user.to_signed_global_id(purpose: "reset_password", expires_in: 30.minutes)
    mail to: @user.email
  end
end
