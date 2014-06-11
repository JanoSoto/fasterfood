require 'test_helper'

class BasicosControllerTest < ActionController::TestCase
  setup do
    @basico = basicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basico" do
    assert_difference('Basico.count') do
      post :create, basico: { en_venta: @basico.en_venta, nombre_producto: @basico.nombre_producto, precio: @basico.precio }
    end

    assert_redirected_to basico_path(assigns(:basico))
  end

  test "should show basico" do
    get :show, id: @basico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basico
    assert_response :success
  end

  test "should update basico" do
    patch :update, id: @basico, basico: { en_venta: @basico.en_venta, nombre_producto: @basico.nombre_producto, precio: @basico.precio }
    assert_redirected_to basico_path(assigns(:basico))
  end

  test "should destroy basico" do
    assert_difference('Basico.count', -1) do
      delete :destroy, id: @basico
    end

    assert_redirected_to basicos_path
  end
end
