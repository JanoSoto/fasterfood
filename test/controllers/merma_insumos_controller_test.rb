require 'test_helper'

class MermaInsumosControllerTest < ActionController::TestCase
  setup do
    @merma_insumo = merma_insumos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merma_insumos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merma_insumo" do
    assert_difference('MermaInsumo.count') do
      post :create, merma_insumo: { cantidad_merma: @merma_insumo.cantidad_merma, comentario_merma: @merma_insumo.comentario_merma, fecha_merma: @merma_insumo.fecha_merma, insumo_id: @merma_insumo.insumo_id }
    end

    assert_redirected_to merma_insumo_path(assigns(:merma_insumo))
  end

  test "should show merma_insumo" do
    get :show, id: @merma_insumo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merma_insumo
    assert_response :success
  end

  test "should update merma_insumo" do
    patch :update, id: @merma_insumo, merma_insumo: { cantidad_merma: @merma_insumo.cantidad_merma, comentario_merma: @merma_insumo.comentario_merma, fecha_merma: @merma_insumo.fecha_merma, insumo_id: @merma_insumo.insumo_id }
    assert_redirected_to merma_insumo_path(assigns(:merma_insumo))
  end

  test "should destroy merma_insumo" do
    assert_difference('MermaInsumo.count', -1) do
      delete :destroy, id: @merma_insumo
    end

    assert_redirected_to merma_insumos_path
  end
end
