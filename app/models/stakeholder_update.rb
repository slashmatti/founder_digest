class StakeholderUpdate < ApplicationRecord
  belongs_to :project

  has_rich_text :content

  def confirmed?
    confirmed_at?
  end
end
