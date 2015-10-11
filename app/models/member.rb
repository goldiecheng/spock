class Member < ActiveRecord::Base
	belongs_to :skill
  has_and_belongs_to_many :epics

	validates_presence_of :name
  validates_uniqueness_of :name
	validates_presence_of :skill
end
