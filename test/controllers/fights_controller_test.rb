require 'test_helper'

class FightsControllerTest < ActionDispatch::IntegrationTest
  test "should get select" do
    get select_fight_url
    assert_response :success
  end

  test "should get go" do
    f1 = fighters(:one)
    f2 = fighters(:two)
    get go_fight_url(f1.id, f2.id)
    assert_response :success
    ff = Fight.all
    assert ff.count == 3
  end

end
