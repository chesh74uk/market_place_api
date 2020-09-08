require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test'user with a valid emailshould be valid' do
    user = User.new(email:'test@test.org', password_digest: 'test')
    assert user.valid?
  end

  test 'user with an invalid email is invalid' do
    user = User.new(email: 'test', password_digest: 'test')
    assert_not user.valid?
  end

  test 'user with duplicate email not valid' do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: 'test')
    assert_not user.valid?
  end

end
