require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create user" do
    u = User.new
    u.username = "test_user"
    u.email = "test@test.com"
    u.password = "salami"
    assert u.save
  end
  
  test "can't create user with blank username/email/passwd" do
    u = User.new
    assert !u.valid?
    assert u.errors[:email].any?
    assert u.errors[:password].any?
    assert u.errors[:username].any?
    assert_equal ["can't be blank"], u.errors[:email]
    assert_equal ["can't be blank"], u.errors[:password]
    assert_equal ["can't be blank"], u.errors[:username]
    assert !u.save
  end
  
  test "can update user" do
    u = users(:user_00001)
    assert u.update_attributes(:username => 'testy')
  end
  
  test "can delete dream" do
    u = users(:user_00001)
    u.destroy
    assert_raise(ActiveRecord::RecordNotFound) {User.find(u.id)}
  end

end
