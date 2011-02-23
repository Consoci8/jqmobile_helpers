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

  end
end