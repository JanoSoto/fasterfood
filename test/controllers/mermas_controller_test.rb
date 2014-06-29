require 'test_helper'

class MermasControllerTest < ActionController::TestCase
  setup do
    @merma = mermas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mermas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merma" do
    assert_difference('Merma.count') do
      post :create, merma: { cantidad_merma: @merma.cantidad_merma, comentario_merma: @merma.comentario_merma, fecha_merma: @merma.fecha_merma }
    end

    assert_redirected_to merma_path(assigns(:merma))
  end

  test "should show merma" do
    get :show, id: @merma
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merma
    assert_response :success
  end

  test "should update merma" do
    patch :update, id: @merma, merma: { cantidad_merma: @merma.cantidad_merma, comentario_merma: @merma.comentario_merma, fecha_merma: @merma.fecha_merma }
    assert_redirected_to merma_path(assigns(:merma))
  end

  test "should destroy merma" do
    assert_difference('Merma.count', -1) do
      delete :destroy, id: @merma
    end

    assert_redirected_to mermas_path
  end
end
