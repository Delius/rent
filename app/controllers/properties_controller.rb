class PropertiesController < ApplicationController
  before_filter :authenticate_user!, only: [:new,:edit,:index ,:create,:update,:destroy]

  def new
    @property = Property.new
  end

  def index
    @properties = Property.paginate page: params[:page], :per_page => 4
  end

  def create
    @property = Property.new(property_params)

    if @property.save
         redirect_to property_path(@property),notice:  'Property was successfully Created.'
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
      else
        format.html { render :edit }
      end
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
