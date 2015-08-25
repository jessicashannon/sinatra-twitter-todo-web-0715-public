# This class handles connecting to the Twitter API. In Rack Todo, this lived in app.rb. Here's we've abstracted it out into its own class. This class we will then initialize in app.rb.

# Our Gemfile has the twitter gem and config/environment requires it through Bundler.

class GetTweets
  attr_reader :handle

  def initialize(handle)
    @handle = handle
  end

  TWITTER = Twitter::REST::Client.new do |config|
    # go to https://dev.twitter.com/apps and create your own twitter app. Then grab your keys and replace these ones
    config.consumer_key = "P2hJTSCoWpgZIAgN8TKWELTEI"
    config.consumer_secret = "k4P0gYC0H0GiN9xxaBHAEjNixPGlc214cQ5BGaaubM3UibeDH9"
    config.access_token = "1561415600-FbNItwPFjvpw8HTsOvla7n5lHT6oIj0haXx9fjI"
    config.access_token_secret = "6do8CrBMcIsXEsQuSDMjbI7f5pIB0YBCwvZPxQbLuxhml"
  end

  def get_search_results
    twitter_search_results = []
    TWITTER.search(handle).each do |tweet|
      # we're saving the tweet user's name and the tweet text in an array of arrays
      twitter_search_results << [tweet.user.name, tweet.text]
    end
    twitter_search_results
  end

end
