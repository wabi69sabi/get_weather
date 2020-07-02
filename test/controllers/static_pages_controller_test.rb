require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get current weather with zip" do
    get current_weather_url, params: {zip: "94501"}
    assert_response :success
  end

  test "should get forecast with zip" do
    get forecast_url, params: {zip: "94501"}
    assert_response :success
  end
end
