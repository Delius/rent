class AddYearReturnToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :year_return_percent, :float
  	add_column :properties, :year_return, :float
  end
end
