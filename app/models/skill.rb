class Skill < ActiveRecord::Base
	has_many :members
  has_many :estimates

	validates_presence_of :name
end
