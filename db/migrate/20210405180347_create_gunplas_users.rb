class CreateGunplasUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :gunplas_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gunpla, null: false, foreign_key: true
    end
  end
end
