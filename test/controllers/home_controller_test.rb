require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get insex" do
    get home_insex_url
    assert_response :success
  end
end
