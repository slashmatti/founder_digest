class Subscriber < ApplicationRecord
  belongs_to :project
  belongs_to :user # (2 parent objects OK) 

  validates_presence_of :user_id, :project_id
end
