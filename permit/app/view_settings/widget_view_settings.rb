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

  def default_form_options
    options = { url: :widgets, method: 'get', enforce_utf8: false }
  end

  def search_form(view_context, &block)
    form(view_context, hide: %i[order filter], &block)
  end

  def filter_form(*args, &block)
    options = args.extract_options!
    view_context = args[0] || options[:view_context]
    form(view_context, options.merge(hide: %i[order search]), &block)
  end

  def order_form(view_context, &block)
    form(view_context, hide: %i[filter search], &block)
  end

  def form(view_context, options, &block)
    raise 'Missing block' unless block

    to_hide = options.delete(:hide) || []
    view_context.simple_form_for self, default_form_options.merge(options) do |builder|
      content = []
      content << builder.input(:search, as: :hidden) if to_hide.include?(:search)
      content << builder.input(:order, as: :hidden) if to_hide.include?(:order)
      if to_hide.include?(:filter)
        content << builder.fields_for(:filter) { |f| f.input :category, as: :hidden }
      end
      content << view_context.capture(builder, &block)
      content.join(' ').html_safe
    end
  end
end
