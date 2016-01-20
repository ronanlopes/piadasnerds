class CalendariosController < ApplicationController
  before_action :set_calendario, only: [:show, :edit, :update, :destroy]

  # GET /calendarios
  # GET /calendarios.json
  def index
    @calendarios = Calendario.all
    gon.eventos = Calendario.all.map{|calendario| {
      "evento" => calendario.evento,
      "data_inicio" => calendario.data_inicio,
      "data_fim" => calendario.data_fim
    }}
  end

  # GET /calendarios/1
  # GET /calendarios/1.json
  def show
  end

  # GET /calendarios/new
  def new
    @calendario = Calendario.new
  end

  # GET /calendarios/1/edit
  def edit
  end

  def salvar_evento
    data_inicio = params["data_inicio"].to_date.advance(days: 1)
    data_fim = params["data_fim"].to_date.advance(days: 1)
    if params["old_title"]
      Calendario.find_by(evento: params["old_title"], data_inicio: data_inicio, data_fim: data_fim).update(evento: params["evento"])
    else
      Calendario.create(evento: params["evento"], data_inicio: data_inicio, data_fim: data_fim)
    end
    render nothing: true
  end

  # POST /calendarios
  # POST /calendarios.json
  def create
    @calendario = Calendario.new(calendario_params)

    respond_to do |format|
      if @calendario.save
        format.html { redirect_to @calendario, notice: 'Calendario was successfully created.' }
        format.json { render :show, status: :created, location: @calendario }
      else
        format.html { render :new }
        format.json { render json: @calendario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendarios/1
  # PATCH/PUT /calendarios/1.json
  def update
    respond_to do |format|
      if @calendario.update(calendario_params)
        format.html { redirect_to @calendario, notice: 'Calendario was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendario }
      else
        format.html { render :edit }
        format.json { render json: @calendario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendarios/1
  # DELETE /calendarios/1.json
  def destroy
    @calendario.destroy
    respond_to do |format|
      format.html { redirect_to calendarios_url, notice: 'Calendario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendario
      @calendario = Calendario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendario_params
      params.require(:calendario).permit(:evento, :data_inicio, :data_fim)
    end
end
