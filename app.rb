require 'sinatra/base'
require 'sinatra/reloader'

class DiaryApp < Sinatra::Base
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  get '/' do
    erb :index
  end

  get '/diary-entries' do
    erb :diary_entries
  end
end
