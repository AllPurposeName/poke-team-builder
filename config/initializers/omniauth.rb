Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["google_client_id"], ENV["google_client_secret"]
  #provider :google_oauth2, '672834951363-2175am62m5vvsa01kmsjdfegmmkhvehp.apps.googleusercontent.com', '0fnL3_5gc7t2-xa1_3RrJrf2'
  {
    :name => "google",
    :prompt => "select_account",
    :scope => "email, profile, plus.me",
    :image_aspect_ratio => "square",
    :image_size => 50
  }
end
