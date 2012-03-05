class TrendsController < ApplicationController
  include HTTParty

  def index
    @trends = Trend.all
    @trend = Trend.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create
    @trend = Trend.new(params[:trend])
    twitter_response = HTTParty.get("http://search.twitter.com/search.json?q=#{URI.escape params[:trend][:query]}&rpp=10&result_type=popular")

    respond_to do |format|
      if @trend.save
        @trend.parse_response twitter_response
        format.html { redirect_to root_url, notice: 'Trend was successfully created.' }
      else
        format.html { redirect_to root_url, error: 'Sorry, there was a problem saving the trend. Please try again'}
      end
    end
  end

  def destroy
    @trend = Trend.find(params[:id])
    @trend.destroy

    respond_to do |format|
      format.html { redirect_to trends_url, notice: 'Destroy was successful.' }
    end
  end
end
