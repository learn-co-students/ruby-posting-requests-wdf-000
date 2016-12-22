class TipsController < ApplicationController
	def create
	    Faraday.post("https://url/to/api") do |req|
  			req.body = "{ "my_param": my_value }"
	    end
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
