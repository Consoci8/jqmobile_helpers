module JqmobileHelpers
  # = JqmobileHelpers List View Helpers
  # Provides a set of methods for making list views 
  # for jquery-mobile markup
  module ListViewsHelper 
    # html5 data attributes options value
    mattr_accessor :default_options 
    
    
    # ====================================== BASIC LIST ===========================================================
    # Creates a simple unordered list containing linked list items 
    # with a data-role="listview" attribute
    # 
    # ==== Options
    #   # => 'data-inset' => 'true' (Default data-inset is set to true)
    #   # => 'data-theme' => 'c' (Default data-theme is set to c)
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
      html_attributes_options(options)
      list = collection.map {|item| content_tag("li", item)}

      content_tag(:ul, list.join.html_safe, default_options)

    end
    
    # ====================================== NUMBERED LIST ===========================================================
    # Creates ordered lists (ol) which is useful when presented items that are in a sequence.
    # When the enhanced markup is applied to the list view, jQuery Mobile will try to first use CSS to add numbers 
    # to the list and, if not supported, will fall back to injecting numbers with JavaScript
    # 
    # ==== Options
    #   # => 'data-inset' => 'true' (Default data-inset is set to true)
    #   # => 'data-theme' => 'c' (Default data-theme is set to c)
    #      
    # ==== Examples
    #   basic_list(@posts.map{|x| x.title})
    #   # => <ol data-role="listview" data-inset="true"><li>Title 1</li><li>test2</li></ol> 
    #
    #   basic_list(@posts.map{|x| link_to(x.title, post_path(x))}, {'data-inset'=>'false', 'data-theme'=>'b'})
    #   # => <ol data-role="listview" data-inset="false" data-theme="b"> \\
    #          <li><a href='/posts/1'>Title 1</a></li><li><a href="/posts/2">test2</a></li></ol> 
    #
    def numbered_list(collection, options = {})
      html_attributes_options(options)
      list = collection.map {|item| content_tag("li", item)}
      content_tag(:ol, list.join.html_safe, self.default_options)
    end
    
    
    # ======================================NESTED LIST ===========================================================
    # By nesting child ul of ol inside list items, you can create nested lists.
    # When a list item with a child list is clicked, the framework will generate a new ui-page populated 
    # with the title of the parent in the header and the list of child elements. 
    # 
    # 
    # ==== Options
    #   # => 'data-inset' => 'true' (Default data-inset is set to true)
    #   # => 'data-theme' => 'c' (Default data-theme is set to c)
    #      
    # ==== Examples
    #   <%= nested_list @posts.map{|x| link_to(x.title, post_path(x))} %>
    #   # => <ul data-inset="true" data-role="listview"><li><ul><li><a href="/birds/1">Bird</a></li></ul></li></ul>
    #
    #
    def nested_list(collection, options = {})
      html_attributes_options(options)
      list = collection.map {|item| content_tag("li", content_tag("ul", content_tag("li", item)))}
      content_tag :ul, list.join.html_safe, self.default_options
    end
    
    # ====================================== SPLIT-BUTTON LIST ===========================================================
    # In cases where there is more than one possible action per list item,
    # a split button can be used to offer two independently clickable items -- the list item and a small arrow icon in the far right
    # The framework will add a vertical divider line and sets the title attribute of the link to the text the link for accessibility.
    # 
    # 
    # ==== Options
    #   # => 'data-inset' => 'true' (Default data-inset is set to true)
    #   # => 'data-theme' => 'c' (Default data-theme is set to c)
    #      
    # ==== Examples
    #   <%= split_button_list "Split Button List", post_path(@posts) %>
    #   # => <ul data-role="listview" data-split-icon="gear" data-split-theme="d"><li><a data-rel="dialog" data-transition="slideup" href="/posts/1">Split Button List</a></li></ul>  
    #
    #
    def split_button_list(name, link, options = {})
      html_options = options.stringify_keys!
      default_options = {'data-role' => "listview", 'data-split-icon' => "gear", 'data-split-theme' => "d"}
      split_options = {'data-rel' => "dialog", 'data-transition' => "slideup"}
      
      list = content_tag("li", content_tag(:a, name, {:href => link}.merge(split_options)))
      content_tag(:ul, list, default_options)
    end
    
    
    # ====================================== BACK-SPLIT-BUTTON LIST ===========================================================
    # In cases where there is more than one possible action per list item,
    # a split button can be used to offer two independently clickable items -- the list item and a small arrow icon in the far right
    # The framework will add a vertical divider line and sets the title attribute of the link to the text the link for accessibility.
    # It is similar for the Split-Button List.
    # 
    # 
    # ==== Options
    #   # => 'data-inset' => 'true' (Default data-inset is set to true)
    #   # => 'data-theme' => 'c' (Default data-theme is set to c)
    #      
    # ==== Examples
    #   <%= back_split_button "Back", posts_path %>
    #   # => <div data-role="content"><a href="index.html" data-role="button" data-rel="back">Back</a></div>  
    #
    #
    def back_split_button(name, link, options ={} )
      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-rel' => "back"}  
      content_tag(:a, name, {:href => link}.merge(default_options))
    end
    
    def count_bubble(collection, options = {})
      list = collection.map {|item| content_tag(:span, item, :class => "ui-li-count")}
      content_tag :ul, :li, list.join.html_safe, self.default_options
    end
    
    private
      
      # Default html5 data attributes for list view in jquery-mobile
      def html_attributes_options(options)
        html_options = options.stringify_keys! 
        self.default_options = {'data-role' => "listview", 'data-inset' => "true"}

        if html_options.has_key?('data-inset')
          self.default_options = default_options.merge({'data-inset' => html_options['data-inset']})
        end

        if html_options.has_key?('data-theme')
          self.default_options = default_options.merge({'data-theme' => html_options['data-theme']})
        end
        
        if html_options.has_key?('data-rel')
          self.default_options = default_options.merge({'data-rel' => html_options['data-rel']})
        end
        
        if html_options.has_key?('data-transition')
          self.default_options = default_options.merge({'data-transition' => html_options['data-transition']})
        end
        
        
      end

  end
end