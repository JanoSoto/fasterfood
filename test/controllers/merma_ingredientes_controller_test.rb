require 'test_helper'

class MermaIngredientesControllerTest < ActionController::TestCase
  setup do
    @merma_ingrediente = merma_ingredientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merma_ingredientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merma_ingrediente" do
    assert_difference('MermaIngrediente.count') do
      post :create, merma_ingrediente: { cantidad: @merma_ingrediente.cantidad, comentario_merma: @merma_ingrediente.comentario_merma, fecha_merma: @merma_ingrediente.fecha_merma, ingrediente_id: @merma_ingrediente.ingrediente_id }
    end

    assert_redirected_to merma_ingrediente_path(assigns(:merma_ingrediente))
  end

  test "should show merma_ingrediente" do
    get :show, id: @merma_ingrediente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merma_ingrediente
    assert_response :success
  end

  test "should update merma_ingrediente" do
    patch :update, id: @merma_ingrediente, merma_ingrediente: { cantidad: @merma_ingrediente.cantidad, comentario_merma: @merma_ingrediente.comentario_merma, fecha_merma: @merma_ingrediente.fecha_merma, ingrediente_id: @merma_ingrediente.ingrediente_id }
    assert_redirected_to merma_ingrediente_path(assigns(:merma_ingrediente))
  end

  test "should destroy merma_ingrediente" do
    assert_difference('MermaIngrediente.count', -1) do
      delete :destroy, id: @merma_ingrediente
    end

    assert_redirected_to merma_ingredientes_path
  end
end
