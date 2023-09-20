class StakeholderUpdate < ApplicationRecord
  include RandomStringable
  
  belongs_to :project

  has_rich_text :content

  before_create :generate_uuid

  scope :confirmed, -> { where.not(confirmed_at: nil) }
  scope :this_month, -> { where("confirmed_at >= ?", Date.today.last_month.beginning_of_month) }
  scope :this_quarter, -> { where("confirmed_at >= ?", Date.today.last_month.beginning_of_month - 2.months) }

  def generate_uuid
    self.uuid = generate_random_string
  end

  def confirmed?
    confirmed_at?
  end

  def user
    project.user
  end
end
