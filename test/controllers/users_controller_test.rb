require "test_helper"

class UsersControllerTest < ActionController::TestCase
  test "new usersees a form" do
    get :new
    assert_instance_of(User, assigns(:user))
    assert_template :new
    assert_response :ok
  end

  test "new user can be created" do
    assert_difference("User.count") do
      post :create, {
      				username: "tallkeith",
             	email: "tallkeith@keith.com", 
             	password: "fghjkl;'",
           	}
    end
    assert_redirected_to root_path
  end

  test "insufficient data redisplays the form" do
    post :create, { email: "yomama" }
    assert_template :new
    assert_not_nil assigns(:user)
  end
end