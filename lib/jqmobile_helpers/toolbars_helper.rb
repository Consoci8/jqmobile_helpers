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
    def header_toolbar_title(title)
      content_tag(:h1, title,'data-fullscreen' => "true")
      
    end

    # Header Bar Home link
    #
    # === Examples
    #
    #  <a href="../../" data-icon="home" data-iconpos="notext" data-direction="reverse" class="ui-btn-right jqm-home">Home</a>
    def header_toolbar_home
      content_tag(:a, "Home",{'href' => "#{root_path}",'data-icon' => "home", 'data-iconpos' =>"notext", 'data-direction' => "reverse", 'class' => "ui-btn-right jqm-home"})
    end

  end
end