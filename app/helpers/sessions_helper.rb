module SessionsHelper
  
  def log_in(user)
    # this session is a built in Rails method
    # it is separate and distinct from the Sessions controller
    # Sessions allow you to store objects in between requests.
    # You can place objects in the session by using the session method, which accesses a hash:
    # session[:person] = Person.authenticate(user_name, password)
    # You can retrieve it again through the same hash:
    # Hello #{session[:person]}
    
    # this places a temporary cookie on the User's browser contraining
    # and encrpyted version of the user's id
    # allows us to retrieve the id on subsequent pages using session[:user_id]
    # sessions method creates this temporary cookie that expires immediately when the browser is closed
    session[:user_id] = user.id
  end
  
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  def current_user
    # we want to retrieve the user from the temporary session if 
    # session[:user_id] exists, but otherwise we want to look for
    # cookies[:user_id] to retrieve the user corresponding to the persistent session
    if !session[:user_id].nil?
      @current_user ||= User.find_by(id: session[:user_id])  
    elsif cookies.signed[:user_id] # if a user_id cookie is present
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.authenticated?(cookies[:remember_token])
        log_in(user)
        @current_user = user
      end
    end
  end
  
  def is_logged_in?
    !current_user.nil?
  end
  
  def remember(user)
    user.remember # this is calling the class remember method in User.rb
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent.signed[:remember_token] = user.remember_token
  end
  
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
    # @current_user ||= User.find_by(id: session[:user_id])
    # if @current_user.nil?
    #   @current_user = User.find_by(id: session[:user_id])  
    # else
    #   @current_user
    # end