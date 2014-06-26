require 'test_helper'

class DetallesControllerTest < ActionController::TestCase
  setup do
    @detalle = detalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle" do
    assert_difference('Detalle.count') do
      post :create, detalle: { basico_id: @detalle.basico_id, compuesto_id: @detalle.compuesto_id, estado: @detalle.estado, intento_entrega: @detalle.intento_entrega, precio: @detalle.precio, tiempo_en_espera: @detalle.tiempo_en_espera, tiempo_entrega: @detalle.tiempo_entrega, tiempo_entregado_deseachado: @detalle.tiempo_entregado_deseachado, tiempo_preparando: @detalle.tiempo_preparando, tiempo_terminado: @detalle.tiempo_terminado }
    end

    assert_redirected_to detalle_path(assigns(:detalle))
  end

  test "should show detalle" do
    get :show, id: @detalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle
    assert_response :success
  end

  test "should update detalle" do
    patch :update, id: @detalle, detalle: { basico_id: @detalle.basico_id, compuesto_id: @detalle.compuesto_id, estado: @detalle.estado, intento_entrega: @detalle.intento_entrega, precio: @detalle.precio, tiempo_en_espera: @detalle.tiempo_en_espera, tiempo_entrega: @detalle.tiempo_entrega, tiempo_entregado_deseachado: @detalle.tiempo_entregado_deseachado, tiempo_preparando: @detalle.tiempo_preparando, tiempo_terminado: @detalle.tiempo_terminado }
    assert_redirected_to detalle_path(assigns(:detalle))
  end

  test "should destroy detalle" do
    assert_difference('Detalle.count', -1) do
      delete :destroy, id: @detalle
    end

    assert_redirected_to detalles_path
  end
end
