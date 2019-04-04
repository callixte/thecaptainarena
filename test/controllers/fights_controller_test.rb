require 'test_helper'

class FightsControllerTest < ActionDispatch::IntegrationTest
  test "should get select" do
    get fights_select_url
    assert_response :success
  end

  test "should get go" do
    get fights_go_url
    assert_response :success
  end

end
