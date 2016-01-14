require 'test_helper'

class GradeHorariosControllerTest < ActionController::TestCase
  setup do
    @grade_horario = grade_horarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grade_horarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grade_horario" do
    assert_difference('GradeHorario.count') do
      post :create, grade_horario: { conteudo: @grade_horario.conteudo, dia: @grade_horario.dia, hora: @grade_horario.hora }
    end

    assert_redirected_to grade_horario_path(assigns(:grade_horario))
  end

  test "should show grade_horario" do
    get :show, id: @grade_horario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grade_horario
    assert_response :success
  end

  test "should update grade_horario" do
    patch :update, id: @grade_horario, grade_horario: { conteudo: @grade_horario.conteudo, dia: @grade_horario.dia, hora: @grade_horario.hora }
    assert_redirected_to grade_horario_path(assigns(:grade_horario))
  end

  test "should destroy grade_horario" do
    assert_difference('GradeHorario.count', -1) do
      delete :destroy, id: @grade_horario
    end

    assert_redirected_to grade_horarios_path
  end
end
