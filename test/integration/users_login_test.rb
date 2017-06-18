require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @michael = users(:michael)
  end
  
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "test layout change with login" do
    get root_path
    assert_select "a[href=?]", login_path, count: 1
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "michael@example.com", password: "password" } }
    assert_redirected_to user_path(@michael)
    follow_redirect!
    assert_select "a[href=?]", logout_path, count: 1
    assert_select "a[href=?]", login_path, count: 0
  end
  
  test "user gets logged in after logging in" do
    get login_path
    post login_path, params: { session: { email: "michael@example.com", password: "password" } }
    assert_redirected_to user_path(@michael)
    follow_redirect!
    assert is_logged_in_test_ver?
    assert_select "a[href=?]", logout_path, count: 1
    assert_select "a[href=?]", login_path, count: 0
  end
  
  test "valid login then logout" do
    get login_path
    post login_path, params: { session: { email: "michael@example.com",
                                         password: "password" } }
    assert is_logged_in_test_ver?
    assert_redirected_to user_path(@michael)
    follow_redirect!
    assert_select "a[href=?]", logout_path, count: 1
    assert_select "a[href=?]", login_path, count: 0
    
    delete logout_path
    assert_not is_logged_in_test_ver?
    assert_redirected_to root_path
    # simulate a user clicking logout in a second window
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", login_path, count: 1
  end
  
  test "remember me checkbox checked" do
    log_in_as(@michael, remember_me: '1')
    assert is_logged_in_test_ver?
    assert_not_empty cookies['user_id']
    assert_not_empty cookies['remember_token']
  end
  
  test "remember me checkbox unchecked" do
    # Log in to set the cookie.
    log_in_as(@michael, remember_me: '1')
    # Log in again and verify that the cookie is deleted.
    log_in_as(@michael, remember_me: '0')
    assert_empty cookies['user_id']
    assert_empty cookies['remember_token']
  end
end
