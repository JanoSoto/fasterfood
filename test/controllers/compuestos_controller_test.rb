require 'test_helper'

class CompuestosControllerTest < ActionController::TestCase
  setup do
    @compuesto = compuestos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compuestos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compuesto" do
    assert_difference('Compuesto.count') do
      post :create, compuesto: { en_venta: @compuesto.en_venta, nombre_producto: @compuesto.nombre_producto, precio: @compuesto.precio }
    end

    assert_redirected_to compuesto_path(assigns(:compuesto))
  end

  test "should show compuesto" do
    get :show, id: @compuesto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compuesto
    assert_response :success
  end

  test "should update compuesto" do
    patch :update, id: @compuesto, compuesto: { en_venta: @compuesto.en_venta, nombre_producto: @compuesto.nombre_producto, precio: @compuesto.precio }
    assert_redirected_to compuesto_path(assigns(:compuesto))
  end

  test "should destroy compuesto" do
    assert_difference('Compuesto.count', -1) do
      delete :destroy, id: @compuesto
    end

    assert_redirected_to compuestos_path
  end
end
