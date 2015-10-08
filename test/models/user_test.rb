  require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Random Name", email: "random@xyz.com", password: "password", password_confirmation: "password")
  end

  test "name_within_limit" do
    @user.name = "x" * 60
    assert_not @user.valid?
  end


  test "email_cannot_be _nil" do
    @user.email = "     "
    assert_not @user.valid?
  end

 
  test "emailid_within_limit" do
    @user.email = "x" * 244 + "@xyz.com"
    assert_not @user.valid?
  end

 test "username_cannot_be_nil" do
    @user.name = "     "
    assert_not @user.valid?
  end

   test "email_should_be_unique" do
    dittouser = @user.dup
    dittouser.email = @user.email.upcase
    @user.save
    assert_not dittouser.valid?
  end

  test "password_should_be_present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password_should_have_min_length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

 test "email_validation" do
    invalid_ad = %w[user@a,com user_at.org user.id@xyz.
                           abc@def_lol.com abc@def+lol.com]
    invalid_ad.each do |invalid_ad|
      @user.email = invalid_ad
      assert_not @user.valid?, "#{invalid_ad.inspect} should be invalid"
    end
  end
 test "email_should_be_saved_as_lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
