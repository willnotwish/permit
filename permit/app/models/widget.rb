class Widget < ActiveRecord::Base
  validates :name, :price, presence: true
end
