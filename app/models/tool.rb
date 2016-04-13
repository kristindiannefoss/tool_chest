class Tool < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  
  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :quantity
end
