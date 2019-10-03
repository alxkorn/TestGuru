require 'test_helper'

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get project" do
    get about_project_url
    assert_response :success
  end

  test "should get author" do
    get about_author_url
    assert_response :success
  end

end
