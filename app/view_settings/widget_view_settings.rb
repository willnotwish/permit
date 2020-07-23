class WidgetViewSettings < ApplicationViewSettings
  attr_accessor :search, :order

  # Must have a filter, even if it's empty
  def filter
    @filter ||= new_filter({})
  end

  # This is what makes nested forms work.
  # See https://coderwall.com/p/kvsbfa/nested-forms-with-activemodel-model-objects
  def filter_attributes=(attrs)
    @filter = new_filter(attrs)
  end

  # The attributes hash.
  # Conforms to ActiveModel::Serialization requirements: note the string keys.
  # See https://guides.rubyonrails.org/active_model_basics.html#serialization
  def attributes
    { 'search' => search, 'order' => order, 'filter_attributes' => filter.attributes }    
  end

  private

  def new_filter(attrs)
    WidgetFilter.new attrs.merge(current_user: current_user)
  end
end
