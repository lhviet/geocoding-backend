require 'test_helper'

class Api::V1::MarkersControllerTest < ActionDispatch::IntegrationTest
  new_marker = { title: 'dump title', lat: 123.123, lng:456.456 }
  setup do
    @marker = markers(:one)
  end

  test "should get index" do
    get api_v1_markers_url, as: :json
    assert_response :success
  end

  test "should create marker" do
    assert_difference('Marker.count') do
      post api_v1_markers_url, params: new_marker, as: :json
    end

    assert_response 201
  end

  test "should show marker" do
    get api_v1_marker_url(@marker), as: :json
    assert_response :success
  end

  test "should update marker" do
    patch api_v1_marker_url(@marker), params: { marker: { lat: new_marker[:lat] } }, as: :json
    assert_response 200
  end

  test "should destroy marker" do
    assert_difference('Marker.count', -1) do
      delete api_v1_marker_url(@marker), as: :json
    end

    assert_response 204
  end
end
