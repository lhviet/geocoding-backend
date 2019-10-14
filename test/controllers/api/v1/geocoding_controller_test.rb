require 'test_helper'

class Api::V1::GeocodingControllerTest < ActionDispatch::IntegrationTest
  test "should get query" do
    get api_v1_geocoding_query_url
    assert_response :success
  end

  test "should get reverse" do
    get api_v1_geocoding_reverse_url
    assert_response :success
  end

end
