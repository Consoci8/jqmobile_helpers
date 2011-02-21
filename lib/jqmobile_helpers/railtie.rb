require 'active_support'

module JqmobileHelpers
  class Railtie < Rails::Railtie
    config.after_initialize do
      if defined?(::ActionController::Base)
        require 'jqmobile_helpers/list_views_helper'
        require 'jqmobile_helpers/toolbars_helper'
        require 'jqmobile_helpers/buttons_helper'
        
        ActionView::Base.send(:include, JqmobileHelpers::ListViewsHelper)
        ActionView::Base.send(:include, JqmobileHelpers::ToolbarsHelper)
        ActionView::Base.send(:include, JqmobileHelpers::ButtonsHelper)
      end
    end
  end  
end