require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/diary'
require_relative './lib/database_manager'
require_relative './database_connection_setup'

class DiaryApp < Sinatra::Base
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  before do
    @diary = Diary.new
  end

  get '/' do
    erb :index
  end

  get '/diary-entries' do
    @entries = @diary.list_all_entries
    erb :diary_entries
  end

  get '/new-entry' do
    erb :new_entry
  end

  post '/new-entry' do
    @diary.add_entry(params)
    redirect '/'
  end
end
