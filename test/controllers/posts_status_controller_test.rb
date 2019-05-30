require 'test_helper'

class PostsStatusControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get posts_status_create_url
    assert_response :success
  end

end
