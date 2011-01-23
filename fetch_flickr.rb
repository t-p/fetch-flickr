require 'rubygems'
require 'sinatra'
require 'flickraw'
require 'haml'

configure do
    set :haml, :format => :html5
end

before do
    FlickRaw.api_key="d21b651c55dd909a31aeb47f76cd478d"
    @photos = flickr.interestingness.getList( :per_page => 5 )
end

get '/' do

    haml :index
end
