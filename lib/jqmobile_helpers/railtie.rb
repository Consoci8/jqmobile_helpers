module JqmobileHelpers
  class Railtie < Rails::Railtie
    initializer 'jqmobile_helpers.initialize' do 
      ActiveSupport.on_load(:action_view) do
        require 'jqmobile_helpers/list_views_helper'
        require 'jqmobile_helpers/toolbars_helper'
        require 'jqmobile_helpers/buttons_helper'
        require 'jqmobile_helpers/action_view_extensions/form_helper'
        require 'jqmobile_helpers/form_builder'
        
        include JqmobileHelpers::ListViewsHelper
        include JqmobileHelpers::ToolbarsHelper
        include JqmobileHelpers::ButtonsHelper
      end
    end
    
    config.before_initialize do
      # To set custom FormBuilder as default
      #config.action_view.default_form_builder = JqmobileHelper::FormBuilder
    end
    
  end  
end