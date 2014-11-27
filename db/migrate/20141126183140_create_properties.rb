class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :postCode
      t.float :propertyCost
      t.float :propertyRent

      t.timestamps
    end
  end
end
