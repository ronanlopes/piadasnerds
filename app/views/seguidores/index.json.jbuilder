json.array!(@seguidores) do |seguidor|
  json.extract! seguidor, :id, :screen_name, :name, :verified, :following, :followers_count, :friends_count, :statuses_count, :favourites_count, :listed_count, :description, :location, :lang, :url, :profile_image_url, :profile_background_image_url
  json.url seguidor_url(seguidor, format: :json)
end
