class AddPlanNameToUserSubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :user_submissions, :plan_name, :string
  end
end
