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
    assert_redirected_to user_path(@michael)
    follow_redirect!
    assert_select "a[href=?]", logout_path, count: 1
    assert_select "a[href=?]", login_path, count: 0
    assert is_logged_in_test_ver?
    
    delete logout_path
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", login_path, count: 1
    assert_not is_logged_in_test_ver?
  end
end
