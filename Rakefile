require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'


ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'gleemur'
})


namespace :sin do
  desc 'db console'
  task :console do
    require './models/user'
    require './models/hangman_game'
    binding.pry
  end
end