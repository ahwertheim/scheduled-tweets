class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet_id)
    tweet = Tweet.find_by(id: tweet_id)
    return if tweet.published?

    # Reschedule a tweet further in the future -> will ignore the initially scheduled tweet
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end
