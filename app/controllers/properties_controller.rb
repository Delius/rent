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
        format.html { redirect_to @property, notice: 'Tip was successfully updated.' }
        format.json { render :show, status: :ok, location: @tip }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
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
