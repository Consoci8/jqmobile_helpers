module JqmobileHelpers
  # = JqmobileHelpers Buttons Helper
  # Provides a set of helper methods for jquery-mobile buttons
  module ButtonsHelper #:nodoc:

    # Button Link
    #
    # ==== Examples
    #   button_link 'New Post', new_post_path
    #   # => <a data-role="button" href="/posts/new" data-theme="c">New Post</a>
    #
    def button_link(name, link, options = {})

      html_options = options.stringify_keys!
      default_options = {'data-role' => "button"}

      if html_options.has_key?('data-icon')
        default_options = default_options.merge({'data-icon' => html_options['data-icon']})
      end

      content_tag(:a, name, :href => link, default_options)
    end

  end
end

