class WidgetViewSettings < ApplicationViewSettings
  attr_accessor :search, :order

  # We must have a filter, even if it's empty
  def filter
    @filter ||= WidgetFilter.new
  end

  # The attributes hash.
  # Conforms to ActiveModel::Serialization requirements: note the string keys.
  # See https://guides.rubyonrails.org/active_model_basics.html#serialization
  def attributes
    { 'search' => search, 'order' => order, 'filter_attributes' => filter.attributes }    
  end

  # This is what makes nested forms work.
  # See https://coderwall.com/p/kvsbfa/nested-forms-with-activemodel-model-objects
  def filter_attributes=(attrs)
    @filter = WidgetFilter.new(attrs)
  end

  def refine_scope(scope)
    # 1. Searching
    if search.present?
      scope = scope.where(Widget.arel_table[:name].matches("%#{search}%"))
    end
    
    # 2. Filter
    scope = filter.apply(scope)

    # 3. Order
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
