module JqmobileHelpers
  # = JqmobileHelpers List View Helpers
  # Provides a set of methods for making list views 
  # for jquery-mobile markup
  module ListViewsHelper #:nodoc:
    
    # Creates a simple unordered list containing linked list items 
    # with a data-role="listview" attribute
    # 
    # ==== Options
    # +'data-inset'+ => +'true'+ (Default data-inset is set to true)
    # +'data-theme'+ => +'a'+ (Default data-theme is set to blank)
    #      
    # ==== Examples
    #   basic_list(@posts.map{|x| x.title})
    #   # => <ul data-role="listview" data-inset="true"><li>Title 1</li><li>test2</li></ul> 
    #
    #   basic_list(@posts.map{|x| link_to(x.title, post_path(x))}, {'data-inset'=>'false', 'data-theme'=>'b'})
    #   # => <ul data-role="listview" data-inset="false" data-theme="b"> \\
    #          <li><a href='/posts/1'>Title 1</a></li><li><a href="/posts/2">test2</a></li></ul> 
    #
    def basic_list(collection, options = {})
      
      html_options = options.stringify_keys! 
      default_options = {'data-role' => "listview", 'data-inset' => "true"}
      
      if html_options.has_key?('data-inset')
        default_options = default_options.merge({'data-inset' => html_options['data-inset']})
      end
      
      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end
          
      list = collection.map {|item| content_tag("li", item)}
      content_tag(:ul, list.join.html_safe, default_options)
    end

  end
end