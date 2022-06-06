require "test_helper"

class ChildcaresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get childcares_index_url
    assert_response :success
  end

  test "should get show" do
    get childcares_show_url
    assert_response :success
  end
end
