class MoviesController < ApplicationController
  def search
    itunes_response = Net::HTTP.get_response('itunes.apple.com', "/search?entity=movie&term=#{URI::encode(params["name"])}")
    @results = JSON.parse(itunes_response.body)

    respond_to do |f|
      f.js { }
    end
  end
end
