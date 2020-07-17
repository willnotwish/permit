require 'test_helper'

class WidgetFiltersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get widget_filters_new_url
    assert_response :success
  end

end
