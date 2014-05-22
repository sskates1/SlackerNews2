#to run this program/file, rune 'ruby server.rb'
#open webpage name 'localhost:4567'
require_relative "server_methods"
require 'sinatra'
require 'net/http'
require 'json'
require 'pry'

result = get_api('http://api.ihackernews.com/page')
csv_file = read_csv("submissions.csv")


get '/' do
  @result = result
  @new_info = csv_file
  @index = 0
  erb :index
end


get '/submit' do
  erb :submit
end

post '/submit' do
  title = params["title"]
  url = params["url"]
  description = params["description"]
  timestamp = Time.now
  File.open("submissions.csv", 'a+') do |file|
    file.puts("#{title},#{url},#{description},#{timestamp}")
  end
  redirect "/"
end

