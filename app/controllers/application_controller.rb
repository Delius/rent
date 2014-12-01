class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def similar
    @property = Property.find(params[:id])
    @response = HTTParty.get("http://api.nestoria.co.uk/api?place_name=#{@property.postCode}&action=search_listings&pretty=1&encoding=json&listing_type=rent&country=uk")
    @data = @response['response']['listings']
    respond_to do |format|
      format.js
    end
  end
end
