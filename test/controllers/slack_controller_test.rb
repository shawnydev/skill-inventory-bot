require 'test_helper'

class SlackControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get slack_index_url
    assert_response :success
  end

  test "should get create" do
    get slack_create_url
    assert_response :success
  end

end
