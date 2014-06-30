require 'test_helper'

class MermaVencimientosControllerTest < ActionController::TestCase
  setup do
    @merma_vencimiento = merma_vencimientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merma_vencimientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merma_vencimiento" do
    assert_difference('MermaVencimiento.count') do
      post :create, merma_vencimiento: { cantidad: @merma_vencimiento.cantidad, fecha_merma: @merma_vencimiento.fecha_merma, lote_id: @merma_vencimiento.lote_id }
    end

    assert_redirected_to merma_vencimiento_path(assigns(:merma_vencimiento))
  end

  test "should show merma_vencimiento" do
    get :show, id: @merma_vencimiento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merma_vencimiento
    assert_response :success
  end

  test "should update merma_vencimiento" do
    patch :update, id: @merma_vencimiento, merma_vencimiento: { cantidad: @merma_vencimiento.cantidad, fecha_merma: @merma_vencimiento.fecha_merma, lote_id: @merma_vencimiento.lote_id }
    assert_redirected_to merma_vencimiento_path(assigns(:merma_vencimiento))
  end

  test "should destroy merma_vencimiento" do
    assert_difference('MermaVencimiento.count', -1) do
      delete :destroy, id: @merma_vencimiento
    end

    assert_redirected_to merma_vencimientos_path
  end
end
