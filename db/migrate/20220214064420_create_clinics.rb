class CreateClinics < ActiveRecord::Migration[6.1]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :postal_code
      t.string :region
      t.text :address
      t.string :municipalities
      t.string :building_name
      t.string :floors
      t.string :fax_number
      t.integer :phone_number

      t.timestamps
    end
  end
end
