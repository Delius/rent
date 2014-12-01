class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_cache_buster
# deletes cache after logout
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
# fetches similar properties based on place name of nestoria api
  def similar
    @property = Property.find(params[:id])
    @response = HTTParty.get("http://api.nestoria.co.uk/api?place_name=#{@property.postCode}&action=search_listings&pretty=1&encoding=json&listing_type=rent&country=uk")
    @data = @response['response']['listings']
    respond_to do |format|
      format.js
    end
  end
end
