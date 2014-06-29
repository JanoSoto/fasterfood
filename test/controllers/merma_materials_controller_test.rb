require 'test_helper'

class MermaMaterialsControllerTest < ActionController::TestCase
  setup do
    @merma_material = merma_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merma_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merma_material" do
    assert_difference('MermaMaterial.count') do
      post :create, merma_material: { cantidad_merma: @merma_material.cantidad_merma, comentario_merma: @merma_material.comentario_merma, fecha_merma: @merma_material.fecha_merma, ingredientes_id: @merma_material.ingredientes_id }
    end

    assert_redirected_to merma_material_path(assigns(:merma_material))
  end

  test "should show merma_material" do
    get :show, id: @merma_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merma_material
    assert_response :success
  end

  test "should update merma_material" do
    patch :update, id: @merma_material, merma_material: { cantidad_merma: @merma_material.cantidad_merma, comentario_merma: @merma_material.comentario_merma, fecha_merma: @merma_material.fecha_merma, ingredientes_id: @merma_material.ingredientes_id }
    assert_redirected_to merma_material_path(assigns(:merma_material))
  end

  test "should destroy merma_material" do
    assert_difference('MermaMaterial.count', -1) do
      delete :destroy, id: @merma_material
    end

    assert_redirected_to merma_materials_path
  end
end
