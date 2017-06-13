class SessionsController < ApplicationController
  
  # the login form corresponds to the new action
  # GET request to the new action
  # the new.html.erb view corresponds to this action (login form)
  def new
  end
  
  # the actual logging in is handled by the POST request to the create action
  # there is no view associated with this action
  def create
  end
  
  # the logging out is handled by a DELETE request to the destroy action
  # there is no view associated with this action
  def destroy
  end
end
