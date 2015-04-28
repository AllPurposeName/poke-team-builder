Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["twitter_client_id"], ENV["twitter_client_secret"]
  { :secure_image_url => 'true',
    :image_size => 'normal',
    :authorize_params => {
    :force_login => 'true',
  }

  }
end
