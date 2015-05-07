class TweetController < ApplicationController
  def create
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["twitter_client_secret"]
      config.consumer_secret     = ENV["twitter_client_id"]
      config.access_token        = current_user.token
      config.access_token_secret = current_user.secret
    end

    client.update("Pokemon Dream Team: #{current_user.pokemon_names}")
    redirect_to root
  end

end
