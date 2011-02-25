module JqmobileHelpers
  # = JqmobileHelpers List View Helpers
  # Provides a set of methods for making toolbars views 
  # for jquery-mobile markup
  module ToolbarsHelper #:nodoc:


    # Header Bar Title
    #
    # === Examples
    #
    # <h1>Page Title</h1>
    #

    def header_toolbar_title(title)
      content_tag(:h1, title)
    end

    # Header Bar Link
    #
    # ---Options ---
    #  => '- data-direction = "reverse" ## reverse transition without actually going back in history
    # => - data-icon [delete,check,home,gear]
    # => - data-iconpos [text,notext] ## if use notext, link only show icon
    # => - class
    # => - data-theme ## default 'a'
    #
    # === Examples
    #
    #  <a href="../../" data-icon="home" data-iconpos="notext" data-direction="reverse" class="ui-btn-right jqm-home">Home</a>
    
    def header_toolbar_link(link_name,path,options = {})
      html_options = options.stringify_keys!
      default_options = {'href' => "#{path}", 'data-direction' => "reverse"}

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-icon')
        default_options = default_options.merge({'data-icon' => html_options['data-icon']})
      end

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      content_tag(:a, "#{link_name}",default_options)
    end

    # navigation bar
    #
    #  A navbar is coded as an unordered list of links wrapped in a container element that has the data-role="navbar" attribute
    #  To set one of links to the active (selected) state, add class="ui-btn-active" to the anchor
    #  The navbar maxes out with 5 items, each 1/5 the width of the browser window
    #  Navbar can be in the header/footer.just add the navbar container inside header/footer container
    #
    #   *** Options ***
    #    => data-icon (to add icon to navbar items)
    #    => data-iconpos="top" (to stack icon above the navbar items label)
    #    => data-theme (set theming for navbar)
    #
    # Example :
    #  <div data-role="navbar">
    #		<ul>
    #			<li><a href="a.html" class="ui-btn-active">One</a></li>
    #			<li><a href="b.html">Two</a></li>
    #		</ul>
    #	</div><!-- /navbar -->

    def navbar_bar(collection, options ={})
      html_options = options.stringify_keys!
      default_options = {}

       if html_options.has_key?('data-icon')
        default_options = default_options.merge({'data-icon' => html_options['data-icon']})
      end

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      list = collection.map {|key,value| content_tag("li",content_tag("a",key, {'href' => "#{value}"}.merge(default_options)))}
      content_tag("div",content_tag(:ul, list.join.html_safe), {'data-role' => 'navbar'})
    end

  end
end