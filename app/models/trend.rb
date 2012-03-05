class Trend < ActiveRecord::Base

  has_many :results
  validates :query, :presence => true
  
  def parse_response(response)
    if response.parsed_response["results"]
      Result.create_results(self, response.parsed_response["results"])
    end
  end
end
