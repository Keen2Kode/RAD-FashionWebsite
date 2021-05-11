# no "Sessions controller", it's logic is placed here
class UsersController < ApplicationController
  before_action :set_item, only: %i[ show edit update]



  def signup
    @user = User.new
  end
  
  def signed
    @user = User.new(signup_params)
    
    if @user.save
      log_in @user
      redirect_to @user
    else
      # render since we want to retain the user.errors
      render 'signup'
    end
  end
  
  
  
  
  
  
  
  
  def login
    @user = User.new
  end
  
  def logged
    name = params[:user][:name]
    password = params[:user][:password]
    user = User.find_by(name: name)
    
    if user && user.authenticate(password)
      # user helper method (accessible since included module in ApplicationController)
      log_in user
      redirect_to user
    else
      @user = User.new
      @user.login_errors(name, password)
      render 'login'
    end
  end
  
  def logout
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
    unless @user and logged_in? @user
      redirect_to current_user || prompt_path
    end
  end
  
  
  
  
  
  
  
  
  private
 
  def set_item
    @user = User.find_by(id: params[:id])
  end
 
  def signup_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def login_params
    params.require(:user).permit(:name, :password)
  end
end
