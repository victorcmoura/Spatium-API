require 'test_helper'

class BuildsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @build = builds(:one)
  end

  test "should get index" do
    get builds_url, as: :json
    assert_response :success
  end

  test "should create build" do
    assert_difference('Build.count') do
      post builds_url, params: { build: { build_aws_id: @build.build_aws_id, build_url: @build.build_url, description: @build.description, dev_tag: @build.dev_tag, is_master: @build.is_master, master_tag: @build.master_tag, name: @build.name } }, as: :json
    end

    assert_response 201
  end

  test "should show build" do
    get build_url(@build), as: :json
    assert_response :success
  end

  test "should update build" do
    patch build_url(@build), params: { build: { build_aws_id: @build.build_aws_id, build_url: @build.build_url, description: @build.description, dev_tag: @build.dev_tag, is_master: @build.is_master, master_tag: @build.master_tag, name: @build.name } }, as: :json
    assert_response 200
  end

  test "should destroy build" do
    assert_difference('Build.count', -1) do
      delete build_url(@build), as: :json
    end

    assert_response 204
  end
end
