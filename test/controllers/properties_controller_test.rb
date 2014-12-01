require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show property" do
    get :show, user_id: @property
    assert_response :success
  end

  include Devise::TestHelpers
end
