require 'test_helper'

class PaymentMethodsControllerTest < ActionController::TestCase
  setup do
    @payment_method = payment_methods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_methods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_method" do
    assert_difference('PaymentMethod.count') do
      post :create, payment_method: { cardholders_name: @payment_method.cardholders_name, cc_number: @payment_method.cc_number, cc_security_code: @payment_method.cc_security_code, experation_date: @payment_method.experation_date, payment_type: @payment_method.payment_type }
    end

    assert_redirected_to payment_method_path(assigns(:payment_method))
  end

  test "should show payment_method" do
    get :show, id: @payment_method
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_method
    assert_response :success
  end

  test "should update payment_method" do
    put :update, id: @payment_method, payment_method: { cardholders_name: @payment_method.cardholders_name, cc_number: @payment_method.cc_number, cc_security_code: @payment_method.cc_security_code, experation_date: @payment_method.experation_date, payment_type: @payment_method.payment_type }
    assert_redirected_to payment_method_path(assigns(:payment_method))
  end

  test "should destroy payment_method" do
    assert_difference('PaymentMethod.count', -1) do
      delete :destroy, id: @payment_method
    end

    assert_redirected_to payment_methods_path
  end
end
