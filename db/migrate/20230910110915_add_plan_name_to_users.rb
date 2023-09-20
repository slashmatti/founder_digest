class AddPlanNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :plan_name, :string
  end
end
