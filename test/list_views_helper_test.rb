require 'test_helper'

class ListViewHelpersHelpersTest < ActiveSupport::TestCase
  include JqmobileHelpers::ListViewsHelper
  
  test "basic list helper" do
    jq_basic_list = basic_list(["apple", "orange"])
    assert_equal "<ul data-role=\"listview\"><li>apple</li><li>orange</li></ul>", jq_basic_list
  end
end
