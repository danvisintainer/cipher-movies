class MoviesController < ApplicationController
  def search
    itunes_response = Net::HTTP.get_response('itunes.apple.com', "/search?entity=movie&term=#{URI::encode(params["name"])}")
    @results = JSON.parse(itunes_response.body)

    respond_to do |f|
      f.js { }
    end
  end

  def create
    # binding.pry
    redirect_to '/login' if !current_user

    itunes_response = Net::HTTP.get_response('itunes.apple.com', "/lookup?id=#{URI::encode(params["movie_id"])}")
    result = JSON.parse(itunes_response.body)["results"].first

    new_movie = Movie.create(itunes_id: result['trackId'], name: result['name'], image_link: result['artworkUrl100'], user_id: current_user.id)

    respond_to do |f|
      f.js { }
    end
  end
end
