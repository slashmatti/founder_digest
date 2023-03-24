class ChangeSubscriptionsToSubscribers < ActiveRecord::Migration[7.0]
  def change
    rename_table :subscriptions, :subscribers
  end
end
