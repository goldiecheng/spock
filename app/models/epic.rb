class Epic < ActiveRecord::Base
  has_and_belongs_to_many :members
  has_many :estimates
  belongs_to :project

  validates_presence_of :name
  validates_presence_of :sort
  validates_presence_of :project_id
  validates :sort, uniqueness: { scope: :project_id }  
end
