class AddReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :counselings, :patient,  null: false, foreign_key: true
  end
end
