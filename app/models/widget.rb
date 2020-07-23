class Widget < ActiveRecord::Base
  validates :name, :price, presence: true

  belongs_to :category, optional: true
  belongs_to :colour, optional: true  
  belongs_to :size, optional: true  
end
