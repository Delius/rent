class AddEmailAndPhoneToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :email, :string
	add_column :properties, :phone_nr, :string
  end
end
