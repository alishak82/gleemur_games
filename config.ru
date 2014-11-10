require 'bundler'
Bundler.require

# Dir.glob('./{helpers,models,controllers}/*.rb').each do |file|
#   require file
#   puts "required #{file}"
# end

require './models/user'
require './models/hangman_game'

require './helpers/authentication_helper'

require './controllers/application_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'
require './controllers/games_controller'
require './controllers/hangman_game_controller'
require './controllers/tic_tac_toe_controller'


map('/tictactoe'){ run TicTacToeController }
map('/hangmans'){ run HangmanGameController }
map('/games'){ run GamesController }
map('/sessions'){ run SessionsController }
map('/users'){ run UsersController }
map('/'){ run ApplicationController }