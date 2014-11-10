class ApplicationController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'gleemur'
  })

  register Sinatra::ActiveRecordExtension

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  enable :sessions, :method_override

  get '/' do
    api_response = HTTParty.get("http://www.colourlovers.com/api/palettes/random")
    @title = api_response['palettes']['palette']['title']
    @hexs = api_response['palettes']['palette']['colors']['hex']
    if current_user
      erb :authenticated
    else
      erb :not_authenticated
    end
  end


end