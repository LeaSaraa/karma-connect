require 'test_helper'

class MyPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get my_posts_new_url
    assert_response :success
  end

end
