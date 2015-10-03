class Estimate < ActiveRecord::Base
  belongs_to :epic
  belongs_to :skill

  validates_presence_of :days
  validates_presence_of :skill
  validates_presence_of :epic  
end
