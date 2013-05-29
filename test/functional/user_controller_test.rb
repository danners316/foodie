require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

  def test_registration_page
    get:register
    title = assigns(:title)
    assert_equal "Register", title
    assert_response :success
    assert_template "register"
  end

end
