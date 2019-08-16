class CreateRegistrationKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :registration_keys do |t|
      t.string :combination
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :registration_keys, :combination, unique: true
  end
end
