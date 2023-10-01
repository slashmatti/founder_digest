class Subscriber < ApplicationRecord
  MAX_SUBSCRIBER_COUNT = 5

  belongs_to :project
  belongs_to :user

  validates_presence_of :user_id, :project_id

  validate :quota_check, on: :create

  def quota_check
    return true if user.pro_plan?

    if user.subscribers.count >= MAX_SUBSCRIBER_COUNT
      errors.add(:base, "Can't have more than #{MAX_SUBSCRIBER_COUNT} subscriptions. Upgrade for unlimited access.")
    end
  end
end
