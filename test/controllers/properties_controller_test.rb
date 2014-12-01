require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase

  test "should get properties" do
    get :properties
    assert_response :success
  end
end
