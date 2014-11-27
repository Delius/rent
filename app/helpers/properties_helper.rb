module PropertiesHelper

  def other_properties

    @property = Property.find(params[:id])

    @response = HTTParty.get("http://api.nestoria.co.uk/api?place_name=#{@property.postal_code}&action=search_listings&pretty=1&encoding=json&listing_type=rent&country=uk")

    @data = @response['response']['listings']

    respond_to do |format|

      format.js
    end
  end
  end

