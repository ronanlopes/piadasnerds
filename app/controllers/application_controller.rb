class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  respond_to :html, :xml, :json, :js

  def index
    @twitter_posts = $twitter.user_timeline("piadasnerds").take(5)
    @twitter_seguidores = ActiveSupport::NumberHelper.number_to_delimited($twitter.user("piadasnerds").followers_count.to_i)
    @facebook_posts = $facebook.get_connection(
                          "me", "feed", {limit: 5,
                          fields: ['message', 'type', 'picture', 'link', 'created_time', 'description', "likes.summary(true)", "shares", "comments.summary(true)"],
                          type: :large
                        })
    @facebook_seguidores = ActiveSupport::NumberHelper.number_to_delimited($facebook.get_object("me", {fields: ["likes"]})["likes"].to_i)
    @instagram_seguidores = Instagram.client(access_token: "2098659368.5d03525.43900e2451464f3690ccddf476b27805").user(2098659368).counts.followed_by
    @instagram_posts = Instagram.user_recent_media("2098659368", {:count => 5})
  end

  def trendings
    @twitter_trends = $twitter.trends(id=23424768, options = {})
    @instagram_trends = Instagram.client.media_popular
  end

  def horarios

  end

  def notas

  end

  def podcast

  end

  def wiki

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
