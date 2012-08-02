class Result < ActiveRecord::Base
  belongs_to :trend
  
  def self.create_from_tweet(twitter_result)
    create(:result => twitter_result["text"], :user_name => twitter_result["from_user"])
  end
end
