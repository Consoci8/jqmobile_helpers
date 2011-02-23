module JqmobileHelpers
  # = JqmobileHelpers Buttons Helper
  # Provides a set of helper methods for jquery-mobile buttons
  module ButtonsHelper
    # html5 data attributes options value
    #   mattr_accessor :default_options

    # Button Link
    #
    # ==== Examples
    #   button_link 'New Post', new_post_path
    #   # => <a data-role="button" href="/posts/new" data-theme="c">New Post</a>
    #
#    def button_link(name, link, options = {})
#      html_attributes_options(options)
#      content_tag(:a, name, {:href => link}.merge(default_options))
#    end
#
#    def delete_button_link(name, link, options = {})
#      html_attributes_options(options)
#      content_tag(:a, name, {:href => link}.merge(default_options))
#    end

    def button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button"}

      if html_options.has_key?('data-theme')
        default_options = default_options.merge({'data-theme' => html_options['data-theme']})
      end

      content_tag(:a, name, {:href => link}.merge(default_options))
    end
#    private
#
#      # Default html5 data attributes for list view in jquery-mobile
#      def html_attributes_options(options)
#        html_options = options.stringify_keys!
#        self.default_options = {'data-role' => "button"}
#
#        if html_options.has_key?('data-icon')
#          self.default_options = default_options.merge({'data-icon' => html_options['data-icon']})
#        end
#
#        if html_options.has_key?('data-theme')
#          self.default_options = default_options.merge({'data-theme' => html_options['data-theme']})
#        end
#
#        if html_options.has_key?('data-iconpos')
#          self.default_options = default_options.merge({'data-iconpos' => html_options['data-iconpos']})
#        end
#      end

  end
end

