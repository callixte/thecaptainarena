require 'test_helper'

class WeaponsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weapons_url
    assert_response :success
  end

  test "should get new" do
    get new_weapon_url
    assert_response :success
  end

  test "should get show" do
    w = weapons(:one)
    get weapon_url(w.id)
    assert_response :success
  end

  test "should get edit" do
    w = weapons(:one)
    get edit_weapon_url(w.id)
    assert_response :success
  end
end
