require 'test_helper'

class CalendariosControllerTest < ActionController::TestCase
  setup do
    @calendario = calendarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calendario" do
    assert_difference('Calendario.count') do
      post :create, calendario: { data_fim: @calendario.data_fim, data_inicio: @calendario.data_inicio, evento: @calendario.evento }
    end

    assert_redirected_to calendario_path(assigns(:calendario))
  end

  test "should show calendario" do
    get :show, id: @calendario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calendario
    assert_response :success
  end

  test "should update calendario" do
    patch :update, id: @calendario, calendario: { data_fim: @calendario.data_fim, data_inicio: @calendario.data_inicio, evento: @calendario.evento }
    assert_redirected_to calendario_path(assigns(:calendario))
  end

  test "should destroy calendario" do
    assert_difference('Calendario.count', -1) do
      delete :destroy, id: @calendario
    end

    assert_redirected_to calendarios_path
  end
end
