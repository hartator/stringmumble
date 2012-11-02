require 'test_helper'

class MumblesControllerTest < ActionController::TestCase
  setup do
    @mumble = mumbles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mumbles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mumble" do
    assert_difference('Mumble.count') do
      post :create, mumble: { string_a: @mumble.string_a, string_b: @mumble.string_b }
    end

    assert_redirected_to mumble_path(assigns(:mumble))
  end

  test "should show mumble" do
    get :show, id: @mumble
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mumble
    assert_response :success
  end

  test "should update mumble" do
    put :update, id: @mumble, mumble: { string_a: @mumble.string_a, string_b: @mumble.string_b }
    assert_redirected_to mumble_path(assigns(:mumble))
  end

  test "should destroy mumble" do
    assert_difference('Mumble.count', -1) do
      delete :destroy, id: @mumble
    end

    assert_redirected_to mumbles_path
  end
end
