class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  respond_to :html, :xml, :json, :js

  def index
    @twitter_posts = $twitter.user_timeline("piadasnerds").take(5)
    #@facebook_posts = $graph.get_connection("me", "feed")
    #@facebook_seguidores = ActiveSupport::NumberHelper.number_to_delimited($graph.get_object("me")["likes"].to_i)
    @facebook_posts = []
    @twitter_seguidores = ActiveSupport::NumberHelper.number_to_delimited($twitter.user("piadasnerds").followers_count.to_i)
  end

  def trendings
    @twitter_trends = $twitter.trends(id=23424768, options = {})
    @instagram_trends = Instagram.client.media_popular
  end

  def horarios

  end

  def mapa_de_seguidores
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
