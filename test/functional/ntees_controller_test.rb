require 'test_helper'

class NteesControllerTest < ActionController::TestCase
  setup do
    @ntee = ntees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ntees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ntee" do
    assert_difference('Ntee.count') do
      post :create, :ntee => { :code => @ntee.code, :description => @ntee.description }
    end

    assert_redirected_to ntee_path(assigns(:ntee))
  end

  test "should show ntee" do
    get :show, :id => @ntee
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ntee
    assert_response :success
  end

  test "should update ntee" do
    put :update, :id => @ntee, :ntee => { :code => @ntee.code, :description => @ntee.description }
    assert_redirected_to ntee_path(assigns(:ntee))
  end

  test "should destroy ntee" do
    assert_difference('Ntee.count', -1) do
      delete :destroy, :id => @ntee
    end

    assert_redirected_to ntees_path
  end
end
