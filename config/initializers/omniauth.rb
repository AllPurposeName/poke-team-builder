Rails.application.config.middleware.use OmniAuth::Builder do
  provider :gplus, ENV["google_client_id"], ENV["google_client_secret"], scope: 'userinfo.email, userinfo.profile'
end
