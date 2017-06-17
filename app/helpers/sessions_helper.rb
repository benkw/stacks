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
    session[:user] = user.id
  end
  
  def current_user
    # if @current_user.nil?
    #   @current_user = User.find_by(id: session[:user_id])  
    # else
    #   @current_user
    # end
    
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def is_logged_in?
    !current_user.nil?
  end
end
