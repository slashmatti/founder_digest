class AddUuidToStakeholderUpdates < ActiveRecord::Migration[7.0]
  def change
    add_column :stakeholder_updates, :uuid, :string
  end
end
