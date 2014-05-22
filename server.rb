#to run this program/file, rune 'ruby server.rb'
#open webpage name 'localhost:4567'
require_relative "server_methods"
require 'sinatra'
require 'net/http'
require 'json'

# helpers do
result = get_api('http://api.ihackernews.com/page')
# end

get '/' do
  @result = result
  erb :index
end



get '/submit' do
  erb :show
end
