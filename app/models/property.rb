class Property < ActiveRecord::Base
belongs_to :user

def year_return
   year_return = (propertyRent * 12)

  end

def year_return_percent
   year_return_percent = (year_return.to_f/propertyCost) * 100

  end
end
