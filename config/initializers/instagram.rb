require "sinatra"
require "instagram"

enable :sessions

CALLBACK_URL = "http://localhost:3000/"
ACCESS_TOKEN = "2098659368.5d03525.43900e2451464f3690ccddf476b27805"

Instagram.configure do |config|

  config.client_id = "5d0352584afa4ba49b7df8bd2aaab4ea"

  config.client_secret = "13c710ac4d4343a9a627282ed44cc02a"

end

get "/oauth/connect" do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/instagram/oauth/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = response.access_token
  redirect "/"
end

