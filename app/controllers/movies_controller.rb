class MoviesController < ApplicationController

  require 'net/http'
  def search
    itunes_response = Net::HTTP.get_response('itunes.apple.com', "/search?entity=movie&term=#{URI::encode(params["name"])}")
    @results = JSON.parse(itunes_response.body)

    respond_to do |f|
      f.js { }
    end
  end

  def create
    if !current_user
      redirect_to '/login' 
    else
      itunes_response = Net::HTTP.get_response('itunes.apple.com', "/lookup?id=#{URI::encode(params["movie_id"])}")
      result = JSON.parse(itunes_response.body)["results"].first

      new_movie = Movie.create(itunes_id: result['trackId'], name: result['trackName'], image_link: result['artworkUrl100'], user_id: current_user.id)

      respond_to do |f|
        f.js { }
      end
    end
  end
end
