require 'test_helper'

class AlertaObsolescenciaControllerTest < ActionController::TestCase
  setup do
    @alerta_obsolescencium = alerta_obsolescencia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alerta_obsolescencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alerta_obsolescencium" do
    assert_difference('AlertaObsolescencium.count') do
      post :create, alerta_obsolescencium: { lote_id: @alerta_obsolescencium.lote_id, mensaje: @alerta_obsolescencium.mensaje, necesidad_cubierta: @alerta_obsolescencium.necesidad_cubierta, tiempo_emision: @alerta_obsolescencium.tiempo_emision, visualizada: @alerta_obsolescencium.visualizada }
    end

    assert_redirected_to alerta_obsolescencium_path(assigns(:alerta_obsolescencium))
  end

  test "should show alerta_obsolescencium" do
    get :show, id: @alerta_obsolescencium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @alerta_obsolescencium
    assert_response :success
  end

  test "should update alerta_obsolescencium" do
    patch :update, id: @alerta_obsolescencium, alerta_obsolescencium: { lote_id: @alerta_obsolescencium.lote_id, mensaje: @alerta_obsolescencium.mensaje, necesidad_cubierta: @alerta_obsolescencium.necesidad_cubierta, tiempo_emision: @alerta_obsolescencium.tiempo_emision, visualizada: @alerta_obsolescencium.visualizada }
    assert_redirected_to alerta_obsolescencium_path(assigns(:alerta_obsolescencium))
  end

  test "should destroy alerta_obsolescencium" do
    assert_difference('AlertaObsolescencium.count', -1) do
      delete :destroy, id: @alerta_obsolescencium
    end

    assert_redirected_to alerta_obsolescencia_path
  end
end
