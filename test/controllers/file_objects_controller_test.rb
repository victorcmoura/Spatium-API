require 'test_helper'

class FileObjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @file_object = file_objects(:one)
  end

  test "should get index" do
    get file_objects_url, as: :json
    assert_response :success
  end

  test "should create file_object" do
    assert_difference('FileObject.count') do
      post file_objects_url, params: { file_object: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show file_object" do
    get file_object_url(@file_object), as: :json
    assert_response :success
  end

  test "should update file_object" do
    patch file_object_url(@file_object), params: { file_object: {  } }, as: :json
    assert_response 200
  end

  test "should destroy file_object" do
    assert_difference('FileObject.count', -1) do
      delete file_object_url(@file_object), as: :json
    end

    assert_response 204
  end
end
