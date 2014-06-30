require 'test_helper'

class DetalleEntregaInsumosControllerTest < ActionController::TestCase
  setup do
    @detalle_entrega_insumo = detalle_entrega_insumos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalle_entrega_insumos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_entrega_insumo" do
    assert_difference('DetalleEntregaInsumo.count') do
      post :create, detalle_entrega_insumo: { cantidad: @detalle_entrega_insumo.cantidad, entrega_id: @detalle_entrega_insumo.entrega_id, insumo_id: @detalle_entrega_insumo.insumo_id, precio: @detalle_entrega_insumo.precio }
    end

    assert_redirected_to detalle_entrega_insumo_path(assigns(:detalle_entrega_insumo))
  end

  test "should show detalle_entrega_insumo" do
    get :show, id: @detalle_entrega_insumo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle_entrega_insumo
    assert_response :success
  end

  test "should update detalle_entrega_insumo" do
    patch :update, id: @detalle_entrega_insumo, detalle_entrega_insumo: { cantidad: @detalle_entrega_insumo.cantidad, entrega_id: @detalle_entrega_insumo.entrega_id, insumo_id: @detalle_entrega_insumo.insumo_id, precio: @detalle_entrega_insumo.precio }
    assert_redirected_to detalle_entrega_insumo_path(assigns(:detalle_entrega_insumo))
  end

  test "should destroy detalle_entrega_insumo" do
    assert_difference('DetalleEntregaInsumo.count', -1) do
      delete :destroy, id: @detalle_entrega_insumo
    end

    assert_redirected_to detalle_entrega_insumos_path
  end
end
