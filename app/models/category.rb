class Category < ApplicationRecord
  has_many :widgets

  validates :name, presence: true
end
