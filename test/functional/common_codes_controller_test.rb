require 'test_helper'

class CommonCodesControllerTest < ActionController::TestCase
  setup do
    @common_code = common_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:common_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create common_code" do
    assert_difference('CommonCode.count') do
      post :create, :common_code => { :code => @common_code.code, :description => @common_code.description }
    end

    assert_redirected_to common_code_path(assigns(:common_code))
  end

  test "should show common_code" do
    get :show, :id => @common_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @common_code
    assert_response :success
  end

  test "should update common_code" do
    put :update, :id => @common_code, :common_code => { :code => @common_code.code, :description => @common_code.description }
    assert_redirected_to common_code_path(assigns(:common_code))
  end

  test "should destroy common_code" do
    assert_difference('CommonCode.count', -1) do
      delete :destroy, :id => @common_code
    end

    assert_redirected_to common_codes_path
  end
end
