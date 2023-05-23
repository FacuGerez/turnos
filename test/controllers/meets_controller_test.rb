require "test_helper"

class MeetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meets_index_url
    assert_response :success
  end
end
