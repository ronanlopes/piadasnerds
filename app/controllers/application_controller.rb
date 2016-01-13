class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  respond_to :html, :xml, :json, :js

  def index

  end

  def trendings

  end


  def mapa_de_usuarios
    gon.pontos = Seguidor.where("lat IS NOT NULL AND long IS NOT NULL").map{|seguidor| {
      "Latitude" => seguidor.lat,
      "Longitude" => seguidor.long,
      "Nome" => seguidor.name,
      "Nick" => seguidor.screen_name,
      "Imagem" => seguidor.profile_image_url,
      "Seguidores" => seguidor.followers_count
      }}
  end
  
end
