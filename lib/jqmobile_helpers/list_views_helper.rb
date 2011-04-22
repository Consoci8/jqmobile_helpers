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
    # ======for collections of data that have more than one.
    #  <% @posts.each do |post|
    #  <%= split_button_list(post.name, post_path(post)) %>
    #  <% end %>
    #
    def split_button_list(name,link, options={})
      html_attributes_options(options)
      default_split_options = {'data-icon' => "gear"}
      split_options = {'data-rel' => "dialog", 'data-transition' => "slideup"}
      list = content_tag("li", content_tag(:a, name, {:href => link}.merge(split_options)))
      #list = content_tag("li", content_tag(:a, data, {:href => link}.merge(split_options)))
      content_tag(:ul, list, self.default_options.merge(default_split_options))
    end


    # ====================================== COUNT-BUBBLE LIST ===========================================================
    # The framework includes text formatting conventions for common list patterns like header/descriptions, 
    # secondary information, counts through HTML semantic markup.
    #To add a count indicator to the right of the list item, wrap the number in an element with a class of ui-li-count
    #
    # ====== Examples
    #      <%= count_bubble(@posts.map do |x| [x.title, link_to(x.title, post_path(x))] end)%>
    #      # => <ul data-inset="true" data-role="listview">
    #              <li><a href="/posts/1">First Title</a>
    #              <span class=ui-li-count>2</span>
    #              </li>
    #           </ul>
    def count_bubble(collection, options = {})
      html_attributes_options(options)
      list = collection.map do |item|
        if item.is_a?(Array)
          if item[1].blank?
            item[1] = content_tag(:a, "No item description", :href => "")
          end
          content_tag("li", "#{item[1]}<span class=ui-li-count>#{item.size}</span>".html_safe)
        else
          content_tag("li", item)
        end
      end
      content_tag(:ul, list.join.html_safe, self.default_options)
    end

    # ====================================== THUMBNAIL LIST ===========================================================
    # To add thumbnails to the left of a list item, the first element in your collection must have a image_tag.
    # The framework will scale the image to 80 pixels square.
    #
    # Items in your collection must also be constructed inside an array with 3 elements inside
    #
    # ==== Examples
    #      <%= thumbnail_list(@posts.collect do |x|
    #	       [image_tag('/images/sample-pic.jpg'), link_to(x.title, post_path(x)), x.title]
    #	     end) %>
    #      # => <ul data-inset="false" data-role="listview">
    #             <li>
    #               <img alt="Album-bb" src="/images/album-bb.jpg" />
    #               <h3><a href="/posts/1">Title 1</a></h3><p>Title 1</p>
    #             </li>
    #           </ul>
    #
    def thumbnail_list(collection, options={})
      html_attributes_options(options)
      list = collection.map do |item|
        if item.is_a?(Array)
          if item[1].blank?
            item[1] = content_tag(:a, "No item description", :href => "")
          end
          content_tag("li", item[0] + "<h3>#{item[1]}</h3><p>#{item[2]}</p>".html_safe)
        else
          content_tag("li", item)
        end
      end
      content_tag(:ul, list.join.html_safe, default_options.update('data-inset' => 'false'))
    end

    # ====================================== ICON LIST ===========================================================
    # To add thumbnails to the left of a list item, the first element in your collection must have a image_tag.
    # The framework will scale the image to 80 pixels square.
    #
    # Items in your collection must also be constructed inside an array with 3 elements inside
    #
    # ==== Examples
    #      <%= icon_list(@posts.collect do |x|
    #	       [image_tag('/images/sample-pic.jpg'), link_to(x.title, post_path(x))]
    #	     end) %>
    #      # => <ul data-inset="false" data-role="listview">
    #             <li><img alt="Gb" class="ui-li-icon" src="https://github.com/jquery/jquery-mobile/blob/master/docs/lists/images/gb.png" />
    #                 <a href="/posts/1">First Title </a>
    #                 <span class=ui-li-count>2</span>
    #             </li>
    #           </ul>
    #
    def icon_list(collection, options = {})
      html_attributes_options(options)
      list = collection.map do |item|
        if item.is_a?(Array)
          if item[1].blank?
            item[1] = content_tag(:a, "No item description", :href => "")
          end
          content_tag("li", item[0] + "#{item[1]}<span class=ui-li-count>#{item.size}</span>".html_safe)
        else
          content_tag("li", item)
        end
      end
      content_tag(:ul, list.join.html_safe, default_options.update('data-inset' => 'false'))
    end

      # ====================================== SEARCH FILTER LIST ===========================================================
      # jQuery Mobile provides a very easy way to filter a list with a simple client-side search feature.
      # To make a list filterable, simply add the data-filter="true" attribute to the list.
      # The framework will then append a search box above the list
      # and add the behavior to filter out list items that don't contain the current search string as the user types.
      #
      # ==== Examples
      #      <%= search_filter_list(@posts.map{|x| link_to(x.title, post_path(x))}) %>
      #      # => <ul data-inset="false" data-role="listview" data-filter="true">
      #             <li>
      #               <a href="/posts/1">Title 1</a></h3><p>Title 1</p>
      #             </li>
      #           </ul>
      #
      def search_filter_list(collection, options = {})
        html_attributes_options(options)
        list = collection.map{|item| content_tag("li", item)}
        content_tag(:ul, list.join.html_safe, default_options.update('data-filter' => 'true', 'data-inset' => 'false'))
      end


      # ====================================== LIST FORMATTING LIST ===========================================================
      # The framework includes text formatting conventions for common list patterns like header/descriptions, secondary information, counts through HTML semantic markup.
      # To add a count indicator to the right of the list item, wrap the number in an element with a class of ui-li-count
      # To add text hierarchy, use headings to increase font emphasis and use paragraphs to reduce emphasis.
      # Supplemental information can be added to the right of each list item by wrapping content in an element with a class of ui-li-aside
      #
      # ==== Examples
      #     <%= list_formatting(@posts.group_by{|s| s.created_at.strftime("%A, %B %d, %Y")}.sort, 'name', 'title', 'content') %>
      #      # 'name', 'title' and 'content' is a database column name
      #      # Arguments for column_one, column_two and column_three should be a database column name
      #      # => <ul data-role="listview">
      #            <li data-role="list-divider">Friday, October 8, 2010 <span class="ui-li-count">2</span></li>
			#            <li>
			#            	 <h3><a href="/posts/1">Stephen Weber</a></h3>
			#            	 <p><strong>You've been invited to a meeting at Filament Group in Boston, MA</strong></p>
			#            	 <p>Hey Stephen, if you're available at 10am tomorrow, we've got a meeting with the jQuery team.</p>
			#            	 <p class="ui-li-aside"><strong>6:24</strong>PM</p>
			#            </li>
			#            <li>
			#            	 <h3><a href="/posts/2">jQuery Team</a></h3>
			#            	 <p><strong>Boston Conference Planning</strong></p>
			#            	 <p>In preparation for the upcoming conference in Boston, we need to start gathering a list of sponsors and speakers.</p>
			#            	 <p class="ui-li-aside"><strong>9:18</strong>AM</p>
			#            </li>
			#           </ul>
      #
      def list_formatting(collection, column_one, column_two, column_three, options = {})

        html_attributes_options(options)
        li_default_options = {'data-role'=>"list-divider"}

        link = controller.controller_name

        list = collection.collect do |created, post|
         tags = [content_tag("li", created + "<span class=\"ui-li-count\">#{post.size}</span>".html_safe, li_default_options, false)]
           tags += post.collect do |p|
             content_tag("li", "<h3><a href=\"#{link}/#{p.id}\">#{p.send(column_one.to_sym)}</a></h3>
                         <p><strong>#{p.send(column_two.to_sym)}</strong></p>
                         <p>#{p.send(column_three.to_sym)}</p>
                         <p class=\"ui-li-aside\"><strong>#{p.created_at.strftime("%I:%M%p")}</strong></p>".html_safe)
           end

            tags
         end

        content_tag(:ul, list.join.html_safe, default_options.update('data-inset' => 'false'))
      end


      # ====================================== LIST DIVIDER ===========================================================
      # List items can be turned into dividers to organize and group the list items. 
      # This is done by adding the data-role="list-divider" to any list item. 
      # These items are styled with the body swatch "b" by default (light gray in the default theme) 
      # but you can specify a theme for dividers by adding the data-groupingtheme attribute and specifying a theme swatch letter.
      #
      # ==== Examples
      #      <%= list_divider(@posts.group_by{|x| x.title[0]}.sort, "title")%>
      #      # => <ul data-role="listview">
			#             <li data-role="list-divider">A</li>
			#               <li><a href="index.html">Adam Kinkaid</a></li>
			#               <li><a href="index.html">Alex Wickerham</a></li>
			#               <li><a href="index.html">Avery Johnson</a></li>
			#             <li data-role="list-divider">B</li>
			#               <li><a href="index.html">Bob Cabot</a></li>
			#           </ul>
      def list_divider(collection, content, options = {})
        html_attributes_options(options)
        link = controller.controller_name
        list = collection.collect do |header, item|
          tags = [content_tag("li", header, {'data-role' => 'list-divider'})]
            tags += item.collect do |i|
              content_tag("li", "<a href=\"#{link}/#{i.id}\">#{i.send(content.to_sym)}</a>".html_safe)
            end
            tags
          end
          content_tag(:ul, list.join.html_safe, self.default_options)
        end

      # ======================================SEARCH FILTER WITH LIST DIVIDER ===========================================================
      # jQuery Mobile provides a very easy way to filter a list with a simple client-side search feature.
      # To make a list filterable, simply add the data-filter="true" attribute to the list and
      # The framework will then append a search box above the list
      # and add the behavior to filter out list items that don't contain the current search string as the user types.
      # List items can be turned into dividers to organize and group the list items. 
      # This is done by adding the data-role="list-divider" to any list item. 
      # These items are styled with the body swatch "b" by default (light gray in the default theme) 
      # but you can specify a theme for dividers by adding the data-groupingtheme attribute and specifying a theme swatch letter.
      #
      # ==== Examples
      # 
      #      <%= list_divider(@posts.group_by{|x| x.title[0]}.sort, "title")%>
      #      # => <ul data-filter="true" data-inset="false" data-role="listview">
      #             <li data-role="list-divider">F</li>
      #               <li>
      #                 <a href="posts/1">First Title </a>
      #               </li>
      #               <li>
      #                 <a href="posts/4">F title</a>
      #               </li>
      #             <li data-role="list-divider">G</li>
      #               <li>
      #                 <a href="posts/3">G. Title</a>
      #               </li>
      #               <li>
      #                 <a href="posts/5">Gold Title</a>
      #               </li>
      #           </ul>
      def search_filter_list_with_divider(collection, content, options = {})
        html_attributes_options(options)
        #list = collection.map{|item| content_tag("li", item)}
        link = controller.controller_name
        list = collection.collect do |header, item|
          tags = [content_tag("li", header, {'data-role' => 'list-divider'})]
            tags += item.collect do |i|
              content_tag("li", "<a href=\"#{link}/#{i.id}\">#{i.send(content.to_sym)}</a>".html_safe)
            end
            tags
          end
        content_tag(:ul, list.join.html_safe, default_options.update('data-filter' => 'true', 'data-inset' => 'false'))
      end
          

    # ====================================== INSET LIST ===========================================================
    #
    # ==== Options
    #   # => 'data-inset' => 'true' (Default data-inset is set to true)
    #   # => 'data-theme' => 'c' (Default data-theme is set to c)
    #
    # ==== Examples
    #   inset_list(@posts.map{|x| x.title})
    #   # => <ul data-role="listview" data-inset="true"><li>Title 1</li><li>test2</li></ul>
    #
    # ==== Examples
    #   ol_inset_list(@posts.map{|x| x.title}, {'data-theme' => "a"} )
    #   # => <ol data-role="listview" data-inset="true" data-theme="a"><li>Title 1</li><li>test2</li></ul>
    #
    def inset_list(collection, options = {})
      html_attributes_options(options)
      list = collection.map {|item| content_tag("li", item)}
      content_tag(:ul, list.join.html_safe, default_options)
    end

    def ol_inset_list(collection, options = {})
      html_attributes_options(options)
      list = collection.map {|item| content_tag("li", item)}
      content_tag(:ol, list.join.html_safe, default_options)
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

      def html_li_attributes_options(options)
        html_options = options.stringify_keys!
        self.li_options = {'data-role' => "list-divider"}

      end

  end
end

