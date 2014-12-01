class Property < ActiveRecord::Base
  belongs_to :user
  validates :propertyCost, :numericality => { :greater_than_or_equal_to => 0 ,message: "only positive numbers" }
  validates :propertyRent, :numericality => { :greater_than_or_equal_to => 0,message: "only positive numbers" }
  validates :phone_nr, format:{ with:  /\d{3}-\d{3}-\d{4}/,message: "bad format" }
  before_save  :year_return, :year_return_percent
  before_create  :year_return, :year_return_percent


  def year_return
    propertyRent * 12

  end

  def year_return_percent
    year_return.to_f/propertyCost * 100

  end




end
