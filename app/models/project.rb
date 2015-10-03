class Project < ActiveRecord::Base
  has_many :epics

  validates_presence_of :name
  validates_presence_of :start_date

  def end_date
    
  end

  def members
    members = []

    epics.each do |epic|
      epic.members.each do |member|
        members << member
      end
    end

    members = members.uniq
  end
end
