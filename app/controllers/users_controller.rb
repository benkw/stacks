class UsersController < ApplicationController
  def new # This action is just responsible for rendering the new user form
    @user = User.new
  end
  
  def create # This action actually creates the user
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Stocker."
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @stacks = @user.stacks
  end
  
  def edit # This action is reponsible for rendering the view
    @user = User.find(params[:id])
  end
  
  def update # this action is responsible for interacting with the model (db updates)
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
  end
  
  private
  
    def user_params
      # require the params hash to have a :user attribute
      # in the :user hash, we only want to permit name, email, pass, and pass_conf
      # will raise an error if :user attribute is missing
      # returns version of params with only the permitted attributes
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
