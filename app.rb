require 'tweetstream'
require 'pusher'

TweetStream.configure do |config|
  config.consumer_key =       ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret =    ENV["TWITTER_CONSUMER_SECRET"]
  config.oauth_token =        ENV["TWITTER_OAUTH_TOKEN"]
  config.oauth_token_secret = ENV["TWITTER_OAUTH_TOKEN_SECRET"]
  config.auth_method        = :oauth
end

TweetStream::Client.new.track('humanities') do |status|
  tweet = status.text.split(" ")
  triggers = %w{art job hiring degree career teacher education dark age code algorithm javascript ruby future html css language data visualisation learning} 
  output = nil 
  triggers.each do |trigger| 
    if tweet.include?(trigger)
      Pusher['concepts'].trigger('live', {message: "#{trigger}"})
    end
  end
end
