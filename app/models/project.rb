class Project < ApplicationRecord
  belongs_to :user
  has_many :stakeholder_updates
  has_many :subscribers
end
