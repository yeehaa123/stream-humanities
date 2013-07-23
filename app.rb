require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = 'Kd1dpVmUQJLHYt4ovcxixg'
  config.consumer_secret    = 'ObfiLCYWK7s6dwl4IRDeYvhlTaajHx95UglwUrVik'
  config.oauth_token        = '1581556471-y73mJIn39e2fFrkcvRxgWkI0YdEmQ3fKaVwekV2'
  config.oauth_token_secret = '9l4MizHlvJWJVtRIpA6wcTAFyFXB5SWCWSazwmLMpk'
  config.auth_method        = :oauth
end

TweetStream::Client.new.sample do |status|
  tweet = status.text.split(" ")
  triggers = %w{art job hiring new degree career teacher education dark age life code algorithm javascript ruby make future html css language data visualisation learning} 
  output = nil 
  triggers.each do |trigger| 
    if tweet.include?(trigger)
      puts trigger 
    end
  end
end
