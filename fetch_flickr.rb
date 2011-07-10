require 'rubygems'
require 'sinatra'
require 'flickraw'
require 'haml'

configure do
    set :haml, :format => :xhtml
end

before do
  # set your flickr key through heroku env or .bashrc for local development    
  FlickRaw.api_key = ENV['FLICKR_KEY']
  @photos = flickr.interestingness.getList( :per_page => 5 )
end

get '/' do

    haml :index
end
