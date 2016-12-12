class TipsController < ApplicationController

  def create
    # binding.pry
    # begin
    id = params[:venue_id]
    tip = params[:tip]
      resp = Faraday.post("https://api.foursquare.com/v2/tips/add") do |req|

        req.params['oauth_token'] = session[:token]
        req.params['v'] = '20160201'
        # req.params['venueId'] = params[:venue_id]
        req.params['venueId'] = id
        # req.params['text'] = params[:tip]
        req.params['text'] = tip
        # req.options.timeout = 0
        binding.pry
      end

      binding.pry
      @output = params[:tip]

    # rescue Faraday::TimeoutError
    #   @error = "There was a timeout. Please try again."
    # end

    redirect_to tips_path
  end


  def index
    resp = Faraday.get("https://api.foursquare.com/v2/lists/self/tips") do |req|
      req.params['oauth_token'] = session[:token]
      req.params['v'] = '20160201'
    end

    @results = JSON.parse(resp.body)["response"]["list"]["listItems"]["items"]
  end


end
