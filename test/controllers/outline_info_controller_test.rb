require 'test_helper'

class OutlineInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get outline_info_show_url
    assert_response :success
  end

end
