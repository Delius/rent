class Property < ActiveRecord::Base
  belongs_to :user

  before_save  :year_return, :year_return_percent
  before_create  :year_return, :year_return_percent


  def year_return
    propertyRent * 12

  end

  def year_return_percent
    year_return.to_f/propertyCost * 100

  end




end
