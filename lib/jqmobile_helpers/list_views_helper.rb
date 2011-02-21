module JqmobileHelpers
  # = JqmobileHelpers List View Helpers
  # Provides a set of methods for making list views 
  # for jquery-mobile markup
  module ListViewsHelper #:nodoc:
    
    # Basic list
    #
    # ==== Examples
    #   basic_list @posts.map{|x| x.title}
    #   # => <ul data-role="listview"><li>Title 1</li><li>test2</li><li>test 3</li></ul> 
    #
    def basic_list(collection)
      list = collection.map {|item| content_tag("li", item)}
      content_tag :ul, list.join.html_safe, 'data-role' => "listview"
    end
    
  end
end