class Subscriber < ApplicationRecord
  belongs_to :project
  belongs_to :user # (2 parent objects OK) 
end
