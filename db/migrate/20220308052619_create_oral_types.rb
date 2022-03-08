class CreateOralTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :oral_types do |t|
      t.string :name
      t.string :exp_date
      t.string :imp_date
      t.references :counseling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
