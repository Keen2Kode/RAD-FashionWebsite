# no "Sessions controller", it's logic is placed here
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update subscription] 
  before_action :redirect_to_correct_user, only: %i[show edit]
  before_action :redirect_if_logged, only: %i[login signup prompt forgot_password]


  def signup
    @user = User.new
  end
  
  def signed
    @user = User.new(signup_params)
    
    if @user.save
      log_in @user
      redirect_to back_path
    else
      # render since we want to retain the user.errors
      render 'signup'
    end
  end
  
  
  
  
  def prompt
  end
  
  def login
    @user = User.new
  end
  
  def logged
    email = params[:user][:email]
    password = params[:user][:password]
    @user = User.find_by(email: email.downcase)
    
    if @user && @user.authenticate(password)
      # user/saved helper method (accessible since included module in ApplicationController)
      store_saved_list
      log_in @user
      redirect_to back_path
    else
      @user = User.new(email: email, password: password)
      @user.login_errors
      render 'login'
    end
  end
  
  def logout
    sync_cookies_saved
    log_out current_user
    redirect_to root_path
  end
  
  # editing user login details 
  
  def edit
  end
  
  def update
    if @user.update(login_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  
  
  
  
  
  
  
  
  
  def show
  end
  
  
  
  
  
  
  
  
  
  
  def subscription
    
    if @user.visitor
      @user.visitor.destroy
      render js: "alert('Your subscription has been revoked. (See newsletter in root to verify)')"
    else
      Visitor.create(email: @user.email)
      render js: "alert('You are subscribed to R&J newsletter! (See newsletter in root to verify)')"
    end
  end
  
  
  
  
  
  
  
  
  
  # form to send email
  def forgot_password
    @user = User.new
  end
  
  def forgot_password_create
    email = params[:user][:email]
    @user = User.find_by(email: email.downcase)
    if @user
      # pass as params[:user] so UserMailer can send an email
      @user.reset_password_mail(request)
      redirect_to login_path, notice: "A link was sent to #{email} to reset your password"
    else 
      @user = User.new(email: email)
      @user.forgot_password_errors
      render 'forgot_password'
    end
  end
  
  
  #form to reset password once you click email link
  def reset_password
    @user = User.find_by_signed_id(params[:token])
    redirect_to login_path, notice: "Your token expired, login again" unless @user
    
  end
  
  def reset_password_create
    @user = User.find_by_signed_id(params[:token])
    if @user.update(reset_password_params)
      redirect_to login_path, notice: "Your password is updated! Complete login to continue"
    else
      render 'reset_password'
    end
  end
  
  
  
  
  
  
  
  
  
  
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to root_path
  end
  
  
  
  
  
  
  
  
  
  
  protected
  
  def auth_hash
    request.env['omniauth.auth']
  end
  
  
  
  
  
  private
 
  def set_user
    @user = User.find_by(id: params[:id])
  end
 
  def signup_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def login_params
    params.require(:user).permit(:email, :password)
  end
  
  def reset_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
  
  
  
  
  
  
  def redirect_to_correct_user
    set_back_path @user ? user_path(@user) : request.path
    unless @user and logged_in? @user
      redirect_to current_user || prompt_path
    end
  end
  
  def redirect_if_logged
    redirect_to current_user, notice: "You're already logged in!" if logged_in?
  end
  
  
  
  
    # an unlogged user can add more saved items
    # the cookies saved list remains unmodified ()
  def store_saved_list
    cookies_saved.each do |item_id| 
      SavedItem.create(user: @user, item_id: item_id)
    end
  end
  
  def sync_cookies_saved
    item_ids = current_user.saved_items.map(&:item_id)
    cookies_set_saved item_ids
  end

end
