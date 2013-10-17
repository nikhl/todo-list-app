class Item < ActiveRecord::Base
  attr_accessible :completed, :name

  validates_presence_of :name
end
