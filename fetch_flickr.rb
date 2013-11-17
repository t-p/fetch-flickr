require 'sinatra/base'
require 'flickraw'
require 'haml'
require 'pry'

class FetchFlickr < Sinatra::Base
  set :views, 'public'
  set :haml,  :format => :html5

  helpers do
    def set_title
      @title ||= "::discovered::"
    end

    def picture_count(owner)
      flickr.people.getPhotosOf(:user_id => owner).count
    end

    def picture_info(id)
      flickr.photos.getInfo(:photo_id => id)
    end

    def get_medium_size_url(id)
      FlickRaw.url_z(picture_info(id))
    end

    def get_small_size_url(id)
      FlickRaw.url_m(picture_info(id))
    end
  end

  before do
    # set your flickr keys through heroku env or .bashrc for local development
    FlickRaw.api_key       = ENV['FLICKR_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SECRET']

    flickr.access_token    = ENV['FLICKR_ACCESS_TOKEN']
    flickr.access_secret   = ENV['FLICKR_ACCESS_SECRET']

    set_title
  end

  get '/' do
    @discovered_pics = flickr.interestingness.getList( :per_page => 5 )

    haml :index
  end

  get '*/pictures' do
    owner_id = params[:splat].first[1..-1]
    @all_owner_pics = flickr.people.getPhotosOf(:user_id => owner_id)

    haml :pictures
  end

  run! if __FILE__ == $0
end
