class AddConfirmedAtToStakeholderUpdates < ActiveRecord::Migration[7.0]
  def change
    add_column :stakeholder_updates, :confirmed_at, :datetime, default: nil
  end
end
