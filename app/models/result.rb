class Result < ActiveRecord::Base
  belongs_to :trend
  
  def self.create_results(trend, results)
    results.each do |twitter_result|
      Result.create(:trend => trend, :result => twitter_result["text"], :user_name => twitter_result["from_user"])
    end
  end
end
