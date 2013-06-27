require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'open-uri'

get '/' do
	@name = "User"
  erb :home
end


get '/search' do
  @query = params[:q]
  url = "http://www.omdbapi.com/?s=#{URI.escape(@query)}"
  @results = JSON.load(open(url).read)
  @movies = @results["Search"]
  erb :result
end


get '/movie' do
  @imdb = params[:id]
  url = "http://www.omdbapi.com/?i=#{URI.escape(@imdb)}&tomatoes=true"
  @film = JSON.load(open(url).read)
  erb :movies
end

