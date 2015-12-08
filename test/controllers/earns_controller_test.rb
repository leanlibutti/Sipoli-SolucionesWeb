require 'test_helper'

class EarnsControllerTest < ActionController::TestCase
  setup do
    @earn = earns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:earns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create earn" do
    assert_difference('Earn.count') do
      post :create, earn: { fech_egr: @earn.fech_egr, fech_ing: @earn.fech_ing, valor: @earn.valor }
    end

    assert_redirected_to earn_path(assigns(:earn))
  end

  test "should show earn" do
    get :show, id: @earn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @earn
    assert_response :success
  end

  test "should update earn" do
    patch :update, id: @earn, earn: { fech_egr: @earn.fech_egr, fech_ing: @earn.fech_ing, valor: @earn.valor }
    assert_redirected_to earn_path(assigns(:earn))
  end

  test "should destroy earn" do
    assert_difference('Earn.count', -1) do
      delete :destroy, id: @earn
    end

    assert_redirected_to earns_path
  end
end
