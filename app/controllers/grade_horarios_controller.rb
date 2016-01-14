class GradeHorariosController < ApplicationController
  before_action :set_grade_horario, only: [:show, :edit, :update, :destroy]

  # GET /grade_horarios
  # GET /grade_horarios.json
  def index
    @grade_horarios = GradeHorario.all
  end

  # GET /grade_horarios/1
  # GET /grade_horarios/1.json
  def show
  end

  # GET /grade_horarios/new
  def new
    @grade_horario = GradeHorario.new
  end

  # GET /grade_horarios/1/edit
  def edit
  end

  # POST /grade_horarios
  # POST /grade_horarios.json
  def create
    @grade_horario = GradeHorario.new(grade_horario_params)

    respond_to do |format|
      if @grade_horario.save
        format.html { redirect_to @grade_horario, notice: 'Grade horario was successfully created.' }
        format.json { render :show, status: :created, location: @grade_horario }
      else
        format.html { render :new }
        format.json { render json: @grade_horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grade_horarios/1
  # PATCH/PUT /grade_horarios/1.json
  def update
    respond_to do |format|
      if @grade_horario.update(grade_horario_params)
        format.html { redirect_to @grade_horario, notice: 'Grade horario was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade_horario }
      else
        format.html { render :edit }
        format.json { render json: @grade_horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grade_horarios/1
  # DELETE /grade_horarios/1.json
  def destroy
    @grade_horario.destroy
    respond_to do |format|
      format.html { redirect_to grade_horarios_url, notice: 'Grade horario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade_horario
      @grade_horario = GradeHorario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_horario_params
      params.require(:grade_horario).permit(:dia, :hora, :conteudo)
    end
end
