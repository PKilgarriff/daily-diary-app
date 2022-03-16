require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/diary'

class DiaryApp < Sinatra::Base
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  before do
    if ENV['ENVIRONMENT'] == 'test'
      @diary = Diary.new(PG, 'daily_diary_test')
    else
      @diary = Diary.new(PG, 'daily_diary')
    end
  end

  get '/' do
    erb :index
  end

  get '/diary-entries' do
    @entries = @diary.list_all_entries
    erb :diary_entries
  end
end
