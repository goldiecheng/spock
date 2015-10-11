class Skill < ActiveRecord::Base
	has_many :members, dependent: :nullify
  has_many :estimates

	validates_presence_of :name
  validates_uniqueness_of :name
end
