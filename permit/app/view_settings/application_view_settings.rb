class ApplicationViewSettings 
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  delegate :to_s, to: :to_params

  attr_reader :attributes
  def initialize(attrs={})
    @attributes = attrs
  end

  delegate :keys, to: :attributes

  class_attribute :param_key

  def param_key
    self.class.param_key || model_name.param_key
  end

  def to_params(attrs = nil)
    params = attributes
    params = params.merge(attrs) if attrs.present?
    { param_key.to_sym => params }
  end
  alias_method :merge, :to_params
end
