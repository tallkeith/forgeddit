require "test_helper"

class PostsControllerTest < ActionController::TestCase
  def sign_in(user)
    session[:user_id] = users(user).id
  end

  def sign_out
    session[:user_id] = nil
  end

  test "unauthenticated users get redirected if they try to create a post" do
    get :new
    assert_redirected_to root_path
    assert_includes flash[:notice], "You have to login to do that"
  end

  test "logged in users can view a new post form" do
    sign_in(:keith)
    get :new
    assert_template :new
    assert_response :ok
  end

   test "insufficient data redisplays the form" do
   	sign_in(:keith)
    post :create, { title: "" }
    assert_template :new    
  end
end