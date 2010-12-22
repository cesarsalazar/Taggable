require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'
require 'dm-core'
require 'dm-validations'
require 'dm-migrations' 
require 'dm-timestamps'
require 'dm-serializer/to_json'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/tags.sqlite3")

class Tag
	
  include DataMapper::Resource
	
	property :id,			Serial
	property :name, 	String, 	:required => true,	:unique => true
	
end

Tag.auto_upgrade!

get '/' do
  haml :index
end

get '/tags' do
	@tags = Tag.all
	content_type :json
	@tags.to_json(:only => [:name])
end
	
post '/create' do
	@tags = params[:tags]
	@tags.each do |t|
		@tag = Tag.first_or_create(:name => t)	
	end
	redirect '/'
end

get '/stylesheets/global.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :global
end
