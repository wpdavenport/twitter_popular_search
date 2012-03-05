class ResultsController < ApplicationController
  
  def show
    @results = trend.results
  end
  
  private
  
  def trend
    @trend ||= Trend.find_by_id(params[:trend_id])
  end
  
end