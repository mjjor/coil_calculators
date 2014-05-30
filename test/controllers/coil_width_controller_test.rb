require 'test_helper'

class CoilWidthControllerTest < ActionController::TestCase
  test "should get widthCalc" do
    get :widthCalc
    assert_response :success
  end

end
