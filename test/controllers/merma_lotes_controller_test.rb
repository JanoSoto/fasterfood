require 'test_helper'

class MermaLotesControllerTest < ActionController::TestCase
  setup do
    @merma_lote = merma_lotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merma_lotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merma_lote" do
    assert_difference('MermaLote.count') do
      post :create, merma_lote: { cantidad: @merma_lote.cantidad, comentario: @merma_lote.comentario, fecha_merma: @merma_lote.fecha_merma, lote_id: @merma_lote.lote_id }
    end

    assert_redirected_to merma_lote_path(assigns(:merma_lote))
  end

  test "should show merma_lote" do
    get :show, id: @merma_lote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merma_lote
    assert_response :success
  end

  test "should update merma_lote" do
    patch :update, id: @merma_lote, merma_lote: { cantidad: @merma_lote.cantidad, comentario: @merma_lote.comentario, fecha_merma: @merma_lote.fecha_merma, lote_id: @merma_lote.lote_id }
    assert_redirected_to merma_lote_path(assigns(:merma_lote))
  end

  test "should destroy merma_lote" do
    assert_difference('MermaLote.count', -1) do
      delete :destroy, id: @merma_lote
    end

    assert_redirected_to merma_lotes_path
  end
end
