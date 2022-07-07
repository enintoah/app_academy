require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get Page" do
    get static_Page_url
    assert_response :success
  end

end
