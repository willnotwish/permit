# A filter which selects from category, colour and size.
# Possible choices are determined from the access rights of the current user

class WidgetFilter
  include ActiveModel::Model

  attr_accessor :current_user
  attr_accessor :category, :colour, :size

  def attributes
    { 'category' => category, 'colour' => colour, 'size' => size }
  end

  def apply(scope)
    scope = scope.where(category: category) if category.present?
    scope = scope.where(colour: colour) if colour.present?
    scope = scope.where(size: size) if size.present?
    scope
  end

  def description
    lines = []
    if category.present?
      lines << "Categories: #{Category.where(id: category).pluck(:name).join(' ')}"
    else
      lines << 'Any category'
    end

    if colour.present?
      lines << "Colours: #{Colour.where(id: colour).pluck(:name).join(' ')}"
    else
      lines << 'Any colour'
    end

    if size.present?
      lines << "Sizes: #{Size.where(id: size).pluck(:name).join(' ')}"
    else
      lines << 'Any size'
    end
    lines
  end

  def possible_categories
    @possible_categories ||= begin
      # Just an example
      current_user == :admin ? Category.all : Category.none
    end
  end

  def possible_colours
    @possible_colours ||= begin
      Colour.all
    end
  end

  def possible_sizes
    @possible_sizes ||= begin
      Size.all
    end
  end

end
