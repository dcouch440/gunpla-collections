class CreateGunplas < ActiveRecord::Migration[5.2]
  def change
    create_table :gunplas do |t|
      t.string :kit_name
      t.string :gundam_name
      t.string :grade
      t.string :scale
      t.string :gundam_series

      t.timestamps
    end
  end
end
