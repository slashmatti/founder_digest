class StakeholderUpdate < ApplicationRecord
  include RandomStringable
  
  belongs_to :project

  has_rich_text :content

  before_create :generate_uuid

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
