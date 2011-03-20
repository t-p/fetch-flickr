require 'rubygems'
require 'sinatra'
require 'flickraw'
require 'haml'

configure do
    set :haml, :format => :xhtml
end

before do
    FlickRaw.api_key=" --- add yout key here --- "
    @photos = flickr.interestingness.getList( :per_page => 5 )
end

get '/' do

    haml :index
end
