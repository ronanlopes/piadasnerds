class SeguidoresController < ApplicationController
  before_action :set_seguidor, only: [:show, :edit, :update, :destroy]

  # GET /seguidores
  # GET /seguidores.json
  def index
    @seguidores = Seguidor.all
  end

  # GET /seguidores/1
  # GET /seguidores/1.json
  def show
  end

  # DELETE /seguidores/1
  # DELETE /seguidores/1.json
  def destroy
    @seguidor.destroy
    respond_to do |format|
      format.html { redirect_to seguidores_url, notice: 'Seguidor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seguidor
      @seguidor = Seguidor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seguidor_params
      params.require(:seguidor).permit(:screen_name, :name, :verified, :following, :followers_count, :friends_count, :statuses_count, :favourites_count, :listed_count, :description, :location, :lang, :url, :profile_image_url, :profile_background_image_url)
    end
end
