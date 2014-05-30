require 'test_helper'

class CoilLengthControllerTest < ActionController::TestCase
  test "should get lengthCalc" do
    get :lengthCalc
    assert_response :success
  end

end
