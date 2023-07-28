class RemoveContentFromStakeholderUpdates < ActiveRecord::Migration[7.0]
  def change
    remove_column :stakeholder_updates, :content, :string
  end
end
