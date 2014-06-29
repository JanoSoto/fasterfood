require 'test_helper'

class DetallesBasicosControllerTest < ActionController::TestCase
  setup do
    @detalles_basico = detalles_basicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalles_basicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalles_basico" do
    assert_difference('DetallesBasico.count') do
      post :create, detalles_basico: { basico_id: @detalles_basico.basico_id, cantidad: @detalles_basico.cantidad, ingrediente_id: @detalles_basico.ingrediente_id }
    end

    assert_redirected_to detalles_basico_path(assigns(:detalles_basico))
  end

  test "should show detalles_basico" do
    get :show, id: @detalles_basico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalles_basico
    assert_response :success
  end

  test "should update detalles_basico" do
    patch :update, id: @detalles_basico, detalles_basico: { basico_id: @detalles_basico.basico_id, cantidad: @detalles_basico.cantidad, ingrediente_id: @detalles_basico.ingrediente_id }
    assert_redirected_to detalles_basico_path(assigns(:detalles_basico))
  end

  test "should destroy detalles_basico" do
    assert_difference('DetallesBasico.count', -1) do
      delete :destroy, id: @detalles_basico
    end

    assert_redirected_to detalles_basicos_path
  end
end
