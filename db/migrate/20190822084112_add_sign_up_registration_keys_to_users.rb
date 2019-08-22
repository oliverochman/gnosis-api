class AddSignUpRegistrationKeysToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sign_up_registration_key, :string
  end
end
