class DropAgent < ActiveRecord::Migration[6.1]
  def change
    drop_table :agents 
  end
end
