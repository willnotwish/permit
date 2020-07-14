class WidgetViewSettings < ApplicationViewSettings
  def search
    attributes[:search]
  end

  def order
    attributes[:order]
  end

  def apply_scope(scope)
    # 1. Searching
    scope = scope.search(search) if search.present?
    # 2. Order
    if order == 'price_low_to_high'
      scope = scope.order(price: :asc)
    elsif order == 'price_high_to_low'
      scope = scope.order(price: :desc)
    elsif order == 'name'
      scope = scope.order(:name)
    end    
    scope      
  end
end
