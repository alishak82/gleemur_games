class SessionsController < ApplicationController

  get '/login' do
    api_response = HTTParty.get("http://www.colourlovers.com/api/palettes/random")
    @title = api_response['palettes']['palette']['title']
    @hexs = api_response['palettes']['palette']['colors']['hex']
    erb :'sessions/login'
  end

  post '/' do
    redirect '/' unless user = User.find_by({username: params[:username]})
  if user.password == params[:password]
    session[:current_user] = user.id
    redirect '/'
  else
    redirect '/'
  end
end

  delete '/' do
    session[:current_user] = nil
    redirect '/'
end

end