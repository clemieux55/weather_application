class Todo < ActiveRecord::Base
  attr_accessible :description, :title

  validates_presence_of :title
  validates_presence_of :description
end
