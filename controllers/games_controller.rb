class GamesController < ApplicationController

  get '/' do
    erb :'games/select'
  end

end