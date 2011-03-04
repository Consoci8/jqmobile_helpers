module JqmobileHelpers
  # = JqmobileHelpers List View Helpers
  # Provides a set of methods for making toolbars views 
  # for jquery-mobile markup
  module ToolbarsHelper 


    # Header Bar Title
    #
    # === Examples
    #
    #  => <%= header_toolbar_title('Put Title Here') %>
    #  => <h1>Page Title</h1>
    #

    def header_toolbar_title(title)
      content_tag(:h1, title)
    end

    # Header Bar Link
    #
    # ---Options ---
    #  => '- data-direction = "reverse" ## reverse transition without actually going back in history
    #  => - data-icon [delete,check,home,gear]
    #  => - data-iconpos [text,notext] ## if use notext, link only show icon
    #  => - class
    #  => - data-theme ## default 'a'
    #
    # === Examples
    #
    #  => <a href="../../" data-icon="home" data-iconpos="notext" data-direction="reverse" class="ui-btn-right jqm-home">
    #  Home</a>
    
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

    # navigation bar container
    #
    #  A navbar is coded as an unordered list of links wrapped in a container element that has
    #  the data-role="navbar" attribute
    #  To set one of links to the active (selected) state, add class="ui-btn-active" to the anchor
    #  The navbar maxes out with 5 items, each 1/5 the width of the browser window
    #  Navbar can be in the header/footer.just add the navbar container inside header/footer container
    #
    #   *** Options ***
    #    => data-role = 'navbar'  (to specify the contanier as navbar)
    #
    # Example :
    #  <div data-role="navbar">
    #		<ul>
    #			<li><a href="a.html" class="ui-btn-active">One</a></li>
    #			<li><a href="b.html">Two</a></li>
    #		</ul>
    #	</div><!-- /navbar -->
    # Usage :
    #  navbar_link(collection)  ** this method is to create the link inside the navbar container
    #  <%= navbar_bar([navbar_link('saya',root_path,{'data-icon' => 'gear'}),navbar_link('saya',root_path,
    #  {'data-icon' => 'gear'}),navbar_link('dia',toolbars_path,{'data-icon' => 'home'}),
    #  navbar_link('kami',toolbars_path,{'data-icon' => 'plus'})]) %>


    def navbar_bar(collection)
      listing = collection.map {|item| content_tag("li",item)}
      content_tag("div",content_tag(:ul, listing.join.html_safe), {'data-role' => 'navbar'})
    end

    # link inside the navbar
    #   *** Options ***
    #    => data-icon (to add icon to navbar items)
    #    => data-iconpos="top" (to stack icon above the navbar items label)
    #    => data-theme (set theming for navbar)
    # Example
    #  # => <a href="a.html" class="ui-btn-active" 'data-icon'="gear">One</a>
    # Usage :
    #  => navbar_link('saya',root_path,{'data-icon' => 'gear'})
    #
    # to set active navbar link when user click
    #  => page = request.fullpath **** (will get the current active page fullpath : localhost/posts will generate /posts
    #  => page_url = page.split(/[0-9]/)[0].gsub('/',"")
    #  **** (will ignore the number in the url and remove '/' from the path : localhots/posts/1 will generate 'posts'
    #  => link_path = link.gsub('/',"")  (will remove '/' symbol from the string : /posts will become posts
    #
    #  if link_path == page_url   (compare the link pass by user in navbar_link() with current active page path
    #    content_tag('a',name, {'href' => "#{link}", 'class' => 'ui-btn-active'}.merge(default_options))
    #    ***** (if true, will append class=ui-btn-active to the navbar link))

    def navbar_link(name,link, options ={})
      html_options = options.stringify_keys!
      default_options = {}

      if html_options.has_key?('data-icon')
        default_options = default_options.merge({'data-icon' => html_options['data-icon']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end


      page = request.fullpath
      page_url = page.split(/[0-9]/)[0].gsub('/',"")
      link_path = link.gsub('/',"")

      if link_path == page_url
        content_tag('a',name, {'href' => "#{link}", 'class' => 'ui-btn-active'}.merge(default_options))
      else
        content_tag('a',name, {'href' => "#{link}"}.merge(default_options))
      end

      
    end


  end
end