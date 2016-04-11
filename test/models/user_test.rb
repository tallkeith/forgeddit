require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "users with an invalid email are rejected" do
    @user = User.new(email: "yourmom",
                     password: "isreallyhot")
    refute @user.valid?
  
  end


end
