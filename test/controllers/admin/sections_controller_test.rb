require 'test_helper'

class Admin::SectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sections_index_url
    assert_response :success
  end

end
