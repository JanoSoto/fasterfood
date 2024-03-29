require 'test_helper'

class VendedorsControllerTest < ActionController::TestCase
  setup do
    @vendedor = vendedors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendedors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendedor" do
    assert_difference('Vendedor.count') do
      post :create, vendedor: { apellido_materno: @vendedor.apellido_materno, apellido_paterno: @vendedor.apellido_paterno, nombre: @vendedor.nombre, rut: @vendedor.rut, telefono: @vendedor.telefono, user_id: @vendedor.user_id }
    end

    assert_redirected_to vendedor_path(assigns(:vendedor))
  end

  test "should show vendedor" do
    get :show, id: @vendedor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendedor
    assert_response :success
  end

  test "should update vendedor" do
    patch :update, id: @vendedor, vendedor: { apellido_materno: @vendedor.apellido_materno, apellido_paterno: @vendedor.apellido_paterno, nombre: @vendedor.nombre, rut: @vendedor.rut, telefono: @vendedor.telefono, user_id: @vendedor.user_id }
    assert_redirected_to vendedor_path(assigns(:vendedor))
  end

  test "should destroy vendedor" do
    assert_difference('Vendedor.count', -1) do
      delete :destroy, id: @vendedor
    end

    assert_redirected_to vendedors_path
  end
end
