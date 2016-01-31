require 'test_helper'

class FontesControllerTest < ActionController::TestCase
  setup do
    @fonte = fontes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fontes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fonte" do
    assert_difference('Fonte.count') do
      post :create, fonte: { nome: @fonte.nome, url: @fonte.url }
    end

    assert_redirected_to fonte_path(assigns(:fonte))
  end

  test "should show fonte" do
    get :show, id: @fonte
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fonte
    assert_response :success
  end

  test "should update fonte" do
    patch :update, id: @fonte, fonte: { nome: @fonte.nome, url: @fonte.url }
    assert_redirected_to fonte_path(assigns(:fonte))
  end

  test "should destroy fonte" do
    assert_difference('Fonte.count', -1) do
      delete :destroy, id: @fonte
    end

    assert_redirected_to fontes_path
  end
end
