require 'test_helper'

class RecepcionMaterialesControllerTest < ActionController::TestCase
  test "should get insumos" do
    get :insumos
    assert_response :success
  end

  test "should get ingredientes" do
    get :ingredientes
    assert_response :success
  end

end
