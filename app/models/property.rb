class Property < ActiveRecord::Base
belongs_to :user

before_save  :year_return, :year_return_percent
before_create  :year_return, :year_return_percent

before_validation :upcase_post_code
before_validation :shorten_post_code




def year_return
   year_return = (propertyRent * 12)

  end

def year_return_percent
   year_return_percent = (year_return.to_f/propertyCost) * 100

end

def upcase_post_code

  self.postCode = self.postCode.upcase

end

def shorten_post_code

  self.postCode = self.postCode.gsub(/\s.*/, '')

end

end
