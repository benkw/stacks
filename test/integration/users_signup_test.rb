require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information does not create a user" do
    get signup_path
    assert_no_difference 'User.count' do 
      post users_path, params: { user: { name: "ben", 
                                       email: "invalid@invalid",
                                       password: "pass", 
                                       password_confirmation: "word" } }
    end
    assert_template 'users/new'
  end
  
  test "valid signup info creates a user" do
    get signup_path
    assert_difference 'User.count', 1 do 
      post users_path, params: { user: { name: "Benjamin Wang", 
                                       email: "valid@valid.com",
                                       password: "password", 
                                       password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in_test_ver?
  end

  
end


