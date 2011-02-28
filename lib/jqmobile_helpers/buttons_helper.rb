module JqmobileHelpers
  # = JqmobileHelpers Buttons Helper
  # Provides a set of helper methods for jquery-mobile buttons
  module ButtonsHelper

    # Button Link
    #
    # ==== Examples
    #   button_link 'New Post', new_post_path
    #   # => <a data-role="button" href="http://google.com">New Post</a>
    #
    #   button_link 'New Post', new_post_path, {'data-theme' => 'c', 'data-icon' => 'plus', 'data-iconpos' => 'right'}
    #   # => <a data-icon="plus" data-iconpos="right" data-role="button" data-theme="c" href="http://google.com">New Post</a>
    #
    def button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button"}

      if html_options.has_key?('data-icon')
        default_options = default_options.merge({'data-icon' => html_options['data-icon']})
      end

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Delete Button Link
    #
    # ==== Examples
    #   delete_button_link 'Delete', destroy_path
    #   # => <a data-role="button" data-icon="delete" href="/posts/new">Delete</a>
    #
    #   delete_button_link 'Delete', destroy_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="delete" data-iconpos="right" data-theme="c" href="/posts/destroy">Delete</a>
    #
    def delete_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "delete"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Left Button Link
    #
    # ==== Examples
    #   left_button_link 'Back', new_post_path
    #   # => <a data-role="button" data-icon="arrow-l" href="/posts/new">Back</a>
    #
    #   left_button_link 'Back', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="arrow-l" data-iconpos="right" data-theme="c" href="/posts/new">Back</a>
    #
    def left_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "arrow-l"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Right Button Link
    #
    # ==== Examples
    #   right_button_link 'Proceed', new_post_path
    #   # => <a data-role="button" data-icon="arrow-r" href="/posts/new" data-theme="c">Proceed</a>
    #
    #   right_button_link 'Proceed', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="arrow-r" data-iconpos="right" data-theme="c" href="/posts/new">Proceed</a>
    #
    def right_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "arrow-r"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Up Button Link
    #
    # ==== Examples
    #   up_button_link 'top', new_post_path
    #   # => <a data-role="button" data-icon="arrow-u" href="/posts/new">top</a>
    #
    #   up_button_link 'top', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'top'}
    #   # => <a data-role="button" data-icon="arrow-u" data-iconpos="top" data-theme="c" href="/posts/new">top</a>
    #
    def up_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "arrow-u"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Down Button Link
    #
    # ==== Examples
    #   down_button_link 'bottom', new_post_path
    #   # => <a data-role="button" data-icon="arrow-d" href="/posts/new">bottom</a>
    #
    #   down_button_link 'bottom', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'bottom'}
    #   # => <a data-role="button" data-icon="arrow-d" data-iconpos="bottom" data-theme="c" href="/posts/new">bottom</a>
    #
    def down_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "arrow-d"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Plus Button Link
    #
    # ==== Examples
    #   plus_button_link 'plus', new_post_path
    #   # => <a data-role="button" data-icon="plus" href="/posts/new">plus</a>
    #
    #   plus_button_link 'plus', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="plus" data-iconpos="right" data-theme="c" href="/posts/new">plus</a>
    #
    def plus_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "plus"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Minus Button Link
    #
    # ==== Examples
    #   minus_button_link 'minus', new_post_path
    #   # => <a data-role="button" data-icon="minus" href="/posts/new">minus</a>
    #
    #   minus_button_link 'minus', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="minus" data-iconpos="right" data-theme="c" href="/posts/new">minus</a>
    #
    def minus_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "minus"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Check Button Link
    #
    # ==== Examples
    #   check_button_link 'check', new_post_path
    #   # => <a data-role="button" data-icon="check" href="/posts/new">check</a>
    #
    #   check_button_link 'check', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="check" data-iconpos="right" data-theme="c" href="/posts/new">check</a>
    #
    def check_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "check"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Gear Button Link
    #
    # ==== Examples
    #   gear_button_link 'gear', new_post_path
    #   # => <a data-role="button" data-icon="gear" href="/posts/new">gear</a>
    #
    #   gear_button_link 'gear', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="gear" data-iconpos="right" data-theme="c" href="/posts/new">gear</a>
    #
    def gear_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "gear"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Refresh Button Link
    #
    # ==== Examples
    #   refresh_button_link 'refresh', new_post_path
    #   # => <a data-role="button" data-icon="refresh" href="/posts/new">refresh</a>
    #
    #   refresh_button_link 'refresh', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="refresh" data-iconpos="right" data-theme="c" href="/posts/new">refresh</a>
    #
    def refresh_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "refresh"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Forward Button Link
    #
    # ==== Examples
    #   forward_button_link 'forward', new_post_path
    #   # => <a data-role="button" data-icon="forward" href="/posts/new">forward</a>
    #
    #   forward_button_link 'forward', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="forward" data-iconpos="right" data-theme="c" href="/posts/new">forward</a>
    #
    def forward_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "forward"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Back Button Link
    #
    # ==== Examples
    #   back_button_link 'back', new_post_path
    #   # => <a data-role="button" data-icon="back" href="/posts/new">back</a>
    #
    #   back_button_link 'back', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="back" data-iconpos="right" data-theme="c" href="/posts/new">back</a>
    #
    def back_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "back"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Grid Button Link
    #
    # ==== Examples
    #   grid_button_link 'grid', new_post_path
    #   # => <a data-role="button" data-icon="grid" href="/posts/new">grid</a>
    #
    #   grid_button_link 'grid', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="grid" data-iconpos="right" data-theme="c" href="/posts/new">grid</a>
    #
    def grid_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "grid"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Star Button Link
    #
    # ==== Examples
    #   star_button_link 'star', new_post_path
    #   # => <a data-role="button" data-icon="star" href="/posts/new">star</a>
    #
    #   star_button_link 'star', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="star" data-iconpos="right" data-theme="c" href="/posts/new">star</a>
    #
    def star_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "star"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Alert Button Link
    #
    # ==== Examples
    #   alert_button_link 'alert', new_post_path
    #   # => <a data-role="button" data-icon="alert" href="/posts/new">alert</a>
    #
    #   alert_button_link 'alert', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="alert" data-iconpos="right" data-theme="c" href="/posts/new">alert</a>
    #
    def alert_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "alert"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Info Button Link
    #
    # ==== Examples
    #   info_button_link 'info', new_post_path
    #   # => <a data-role="button" data-icon="info" href="/posts/new">info</a>
    #
    #   info_button_link 'info', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="info" data-iconpos="right" data-theme="c" href="/posts/new">info</a>
    #
    def info_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "info"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Home Button Link
    #
    # ==== Examples
    #   home_button_link 'home', new_post_path
    #   # => <a data-role="button" data-icon="home" href="/posts/new">home</a>
    #
    #   home_button_link 'home', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="home" data-iconpos="right" data-theme="c" href="/posts/new">home</a>
    #
    def home_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "home"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end

    # Search Button Link
    #
    # ==== Examples
    #   search_button_link 'search', new_post_path
    #   # => <a data-role="button" data-icon="search" href="/posts/new">search</a>
    #
    #   search_button_link 'search', new_post_path, {'data-theme' => 'c', 'data-iconpos' => 'right'}
    #   # => <a data-role="button" data-icon="search" data-iconpos="right" data-theme="c" href="/posts/new">search</a>
    #
    def search_button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button", 'data-icon' => "search"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      if html_options.has_key?('data-iconpos')
        default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
      end

      if html_options.has_key?('data-inline')
        default_options = default_options.merge({'data-inline' => html_options['data-inline']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end
    
    
    
    # ====================================== BACK-SPLIT-BUTTON ===========================================================
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

    # Grouped Button
    #
    # ==== Examples
    #   group_button("
    #       #{home_button_link('home', buttons_path, 'data-iconpos' => 'right')}
    #       #{refresh_button_link 'refresh', buttons_path}
    #        ")
    #   # => <div data-role="controlgroup">
    #          <a data-icon="home" data-iconpos="right" data-role="button" href="/buttons">home</a>
    #          <a data-icon="refresh" data-role="button" href="/buttons">refresh</a>
    #        </div>
    #
    #   group_button("
    #       #{home_button_link('home', buttons_path, 'data-iconpos' => 'right')}
    #       #{refresh_button_link 'refresh', buttons_path}, {'data-type' => 'horizontal'}
    #        ")
    #   # => <div data-role="controlgroup" data-type="horizontal" >
    #          <a data-icon="home" data-iconpos="right" data-role="button" href="/buttons">home</a>
    #          <a data-icon="refresh" data-role="button" href="/buttons">refresh</a>
    #        </div>
    def group_button(content, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role'=> "controlgroup"}

      if html_options.has_key?('data-type')
        default_options = default_options.merge({'data-type' => html_options['data-type']})
      end

      content_tag(:div, content, default_options, false)
    end

  end
end

