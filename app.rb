require 'sinatra/base'
require 'sinatra/reloader'

class DiaryApp < Sinatra::Base
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  get '/' do
    'Welcome to the Daily Diary!'
  end
end
