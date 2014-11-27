class PropertiesController < ApplicationController
  before_filter :authenticate_user!, only: [:new,:edit, :create,:update,:destroy]

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to property_path(@property)

    else
      render "new"
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @tip }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end


  def other_properties

    @property = Property.find(params[:id])

    @response = HTTParty.get("http://api.nestoria.co.uk/api?place_name=#{@property.postCode}&action=search_listings&pretty=1&encoding=json&listing_type=rent&country=uk")

    @data = @response['response']['listings']

    respond_to do |format|

      format.js
    end

  end
  private

  def property_params
    params.require(:property).permit(	:email,
                                       :phone_nr,
                                       :postCode,
                                       :propertyCost,
                                       :propertyRent,
    )

  end

end
