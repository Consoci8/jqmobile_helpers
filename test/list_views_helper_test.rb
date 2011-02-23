require 'test_helper'

class ListViewHelperTest < ActiveSupport::TestCase
  include JqmobileHelpers::ListViewsHelper
  
  test "basic list helper" do
    jq_basic_list = basic_list(["apple", "orange"])
    assert_equal "<ul data-inset=\"true\" data-role=\"listview\"><li>apple</li><li>orange</li></ul>", jq_basic_list
  end
  
  test "basic linked list helper with options" do  
    collection = [{:name => "Cs8", :link => "http://google.com/serach?q=Cs8"}]
    basic_list = basic_list(collection.map{|x| link_to(x[:name], x[:link])}, {'data-theme' => 'b'})
    assert_equal "<ul data-inset=\"true\" data-role=\"listview\" data-theme=\"b\"><li><a href=\"http://google.com/serach?q=Cs8\">Cs8</a></li></ul>", basic_list
  end
end
