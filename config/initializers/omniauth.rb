# Replace API_KEY and API_SECRET with the values you got from Twitter

Rails.application.config.middleware.use OmniAuth::Builder do

  provider :twitter, "OkcGoczBXi1x7cKYkvN0imnNN", "ptuqJyYVDwcLKszcTQTWXG7LbkUK2x4zmLzEu82XX9fAwi0Csx"

end