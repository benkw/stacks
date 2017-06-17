class SessionsController < ApplicationController
  
  # the login form corresponds to the new action
  # GET request to the new action
  # the new.html.erb view corresponds to this action (login form)
  def new
  end
  
  # the actual logging in is handled by the POST request to the create action
  # there is no view associated with this action
  def create
    submitted_user = User.find_by(email: params[:session][:email].downcase)
    
    # has_secure_password automatically adds an authenticate 
    # method to the corresponding model objects. 
    # This method determines if a given password is valid for a 
    # particular user by computing its digest and comparing the 
    # result to password_digest in the database. 
    if submitted_user && submitted_user.authenticate(params[:session][:password])
      # create temporary cookie containing submitted_user's id, using Rails sessions method in SessionHelper
      log_in submitted_user
      redirect_to submitted_user # same as user_url(submitted_user)
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new' # renders the new view if failed password attempt
    end
  end
  
  # the logging out is handled by a DELETE request to the destroy action
  # there is no view associated with this action
  def destroy
  end
end
