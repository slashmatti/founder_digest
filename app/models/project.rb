class Project < ApplicationRecord
  belongs_to :user
  has_many :stakeholder_updates, dependent: :destroy
  has_many :subscribers, dependent: :destroy

  scope :ready, -> { where.not(title: nil).where.not(website: nil).where.not(description: nil) }
  scope :recent, -> { where(created_at: 12.hours.ago..Time.now) }

  def self.except(project)
    where.not(id: project.id)
  end

  def latest_stakeholder_update
    stakeholder_updates.order(created_at: :desc).first
  end
end
