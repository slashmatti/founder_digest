class AddAuthCodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :auth_code, :string
  end
end
