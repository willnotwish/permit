class Widget < ActiveRecord::Base
  validates :name, :price, presence: true

  class << self
    def search(criteria)
      where arel_table[:name].matches("%#{criteria}%")
    end
  end
end
