class ApplicationViewSettings 
  include ActiveModel::Model
  include ActiveModel::Serialization

  delegate :to_s, to: :options_for_url

  class_attribute :param_key

  def param_key
    self.class.param_key || model_name.param_key
  end

  # Encodes all the settings in a hash suitable for generating a URL.
  # Typically pass this as a parameter to Rails' URL helpers such as
  # link_to or url_for
  def options_for_url(attrs = {})
    merged_attrs = attributes.merge(attrs.with_indifferent_access)
    { param_key => merged_attrs }
  end

  # merge is a familiar alias in the style of params.merge
  alias_method :merge, :options_for_url
end
