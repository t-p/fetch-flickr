require 'rubygems'
require 'sinatra'
require 'flickraw'
require 'haml'

configure do
    set :haml, :format => :html5
end

before do
    FlickRaw.api_key="-- insert your own key here --"
    @photos = flickr.interestingness.getList( :per_page => 5 )
end

get '/' do

    haml :index
end
