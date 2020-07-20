# A very simple filter which operates on a single category
class WidgetFilter
  include ActiveModel::Model

  attr_accessor :category

  def attributes
    { 'category' => category }
  end

  def apply(scope)
    category.present? ? scope.where(category: category) : scope
  end
end
