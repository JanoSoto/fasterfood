require 'test_helper'

class CreateDetallesBasicosControllerTest < ActionController::TestCase
  setup do
    @create_detalles_basico = create_detalles_basicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:create_detalles_basicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create create_detalles_basico" do
    assert_difference('CreateDetallesBasico.count') do
      post :create, create_detalles_basico: { basico_id: @create_detalles_basico.basico_id, cantidad: @create_detalles_basico.cantidad, ingrediente_id: @create_detalles_basico.ingrediente_id }
    end

    assert_redirected_to create_detalles_basico_path(assigns(:create_detalles_basico))
  end

  test "should show create_detalles_basico" do
    get :show, id: @create_detalles_basico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @create_detalles_basico
    assert_response :success
  end

  test "should update create_detalles_basico" do
    patch :update, id: @create_detalles_basico, create_detalles_basico: { basico_id: @create_detalles_basico.basico_id, cantidad: @create_detalles_basico.cantidad, ingrediente_id: @create_detalles_basico.ingrediente_id }
    assert_redirected_to create_detalles_basico_path(assigns(:create_detalles_basico))
  end

  test "should destroy create_detalles_basico" do
    assert_difference('CreateDetallesBasico.count', -1) do
      delete :destroy, id: @create_detalles_basico
    end

    assert_redirected_to create_detalles_basicos_path
  end
end
