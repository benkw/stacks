require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:michael)
    remember(@user)
  end

  # test "current_user returns right user when session is nil" do
  #   assert_equal @user, current_user
  #   assert is_logged_in?
  # end

  test "current_user returns right user when session is set" do
    log_in @user
    assert_equal @user, current_user
    assert is_logged_in?
  end
  
  test "current_user returns no user when session is nil" do
    assert_nil current_user
    assert !is_logged_in?
  end

  test "current_user returns nil when remember digest is wrong" do
    # replaces the user's remember_digest with the digest of a random value, thus invalidating the cookie
    puts "before update #{@user.remember_digest}"
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    puts "after update #{@user.remember_digest}"
    assert_nil current_user
  end
end