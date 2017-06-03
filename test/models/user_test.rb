require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Benjamin Wang", email: "ben@wang.com",
                     password: "foobar", password_confirmation: "foobar")
    @duplicate_user = @user.dup
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "blank name is invalid" do
    @user.name = "    "
    assert_not @user.valid?
  end
  
  test "blank email is also invalid" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "name must be < 50 chars" do
    @user.name = "q" * 51
    assert_not @user.valid?
  end
  
  test "email must be < 255 chars" do
    @user.email = "q" * 256
    assert_not @user.valid?
  end
  
  test "test valid emails" do
    valid_addresses = ["user@example.com", "USER@foo.COM", "A_US-ER@foo.bar.org", 
                       "first.last@foo.jp", "alice+bob@baz.cn"]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?
    end
  end
  
  test "test invalid emails" do
    invalid_addresses = ["user@example,com", "user_at_foo.org", "user.name@example.",
                         "foo@bar_baz.com", "foo@bar+baz.com"]
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?
    end
  end
  
  test "email address cannot be used twice" do
    @duplicate_user.email.upcase! # make sure the test is case sensitive
    # duplicate_user's email is BEN@WANG.COM while user's email is ben@wang.com
    @user.save
    assert_not @duplicate_user.valid?
  end
  
  test "email downcases before saving" do
    @user.email = "FooBAR@emAil.COM"
    @user.save
    assert @user.email == "foobar@email.com"
  end
  
  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  test "password should be at least 6 characters" do
    @user.password = @user.password_confirmation = "A" * 5
    assert_not @user.valid?
  end
  
  test "test password and password_confirmation are equal" do
    # bcrypt has_secure_password does this
    @user.password = "password"
    @user.password_confirmation = "passsword"
    assert_not @user.valid?
  end
  
end
