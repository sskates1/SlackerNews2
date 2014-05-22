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
  erb :submit
end

post '/submit' do
  title = params["title"]
  url = params["url"]
  description = params["description"]
  File.open("submissions.csv", 'a+') do |file|
    file.puts("#{title},#{url},#{description}")
  end
  redirect "/"
end

