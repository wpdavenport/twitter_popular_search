class Trend < ActiveRecord::Base
  include HTTParty
  
  has_many :results
  validates :query, :presence => true
  
  def self.create_and_search(params)
    trend = Trend.new(params)
    twitter_response = get("http://search.twitter.com/search.json?q=#{URI.escape params[:query]}&rpp=10")
    if trend.save
      trend.call_parse_reponse(twitter_response)
    else
      false
    end
  end
  
  def call_parse_reponse(response)
    parse_response(response)
  end
  
  private

  def parse_response(response)
    if response["results"]
      response["results"].each do |twitter_result|
        results.create_from_tweet(twitter_result)
      end
    end
  end
  
end
