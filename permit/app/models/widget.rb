class Widget < ActiveRecord::Base
  validates :name, :price, presence: true

  belongs_to :category, optional: true
end
