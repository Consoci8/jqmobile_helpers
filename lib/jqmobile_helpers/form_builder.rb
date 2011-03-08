module JqmobileHelpers
  # = JqmobileHelpers Form Helper
  # 
  # Credits to https://github.com/alexreisner for his Informant formbuilder
  # 
  # Provides a set of helper methods for jquery-mobile form elements
  # 
  # Displays rails helpers fields within a div tag, label on one line, field below it.
  # Simplify your form code by encapsulating all
  # aspects of a field (label, description, etc) in a single method call. 
  #
  # All field methods accept an options hash like the standard Rails FormBuilder methods
  class FormBuilder < ActionView::Helpers::FormBuilder
    # Declare some options as custom (don't pass to built-in form helpers).
    @@custom_field_options = [:label, :required, :description, :decoration]
    @@custom_label_options = [:required, :colon, :label_for]

    @@custom_options = @@custom_field_options + @@custom_label_options

    # Run already-defined helpers through our "shell".
    # See ActionView::Helpers::FormBuilder.field_helpers
    helpers = field_helpers +
      %w(select time_zone_select date_select) -
      %w(hidden_field fields_for label)
    helpers.each do |h|
      define_method h do |field, *args|
        options = args.detect { |a| a.is_a?(Hash) } || {}
        case h 
        when 'check_box'
          template = "check_box_field"
          options[:colon] = false
        when 'radio_button'
          template = "radio_button_choice"
          options[:colon] = false
        else
          template = "default_field"
        end
        build_shell(field, options, template) { super(field, *args) }
      end
    end

    # Render a set of radio buttons. Takes a method name, an array of
    # choices (just like a +select+ field), and an options hash.
    #
    def radio_buttons(method, choices, options = {})
      choices.map!{ |i| i.is_a?(Array) ? i : [i] }
      build_shell(method, options, "radio_buttons_field") do
        choices.map{ |c| radio_button method, c[1], :label => c[0],
          :label_for => [object_name, method, c[1].to_s.downcase].join('_') }
      end
    end

    # Render a set of check boxes for selecting HABTM-associated objects.
    # Takes a method name (eg, category_ids), an array of
    # choices (just like a +select+ field), and an options hash.
    # In the default template the check boxes are enclosed in a <div> with
    # CSS class <tt>habtm_check_boxes</tt> which can be styled thusly to
    # achieve a scrolling list:
    # 
    #   .habtm_check_boxes {
    #     overflow: auto;
    #     height: 150px;
    #   }
    # 
    # A hidden field is included which eliminates the need to handle the
    # no-boxes-checked case in the controller, for example:
    # 
    #   <input type="hidden" name="article[categories][]" value="" />
    # 
    # This ensures that un-checking all boxes will work as expected.
    # Unfortunately the check_box template is not applied to each check box
    # (because the standard method of querying the @object for the field's
    # value does not work--ie, there is no "categories[]" method).
    # 
    # ==== Examples
    # <%= f.habtm_check_boxes :feature_ids,Feature.all.map{ |m| [m.name, m.id] } %>
    #
    def habtm_check_boxes(method, choices, options = {}) #:nodoc:
      choices.map!{ |i| i.is_a?(Array) ? i : [i] }
      base_id   = "#{object_name}_#{method}"
      base_name = "#{object_name}[#{method}]"

      @template.hidden_field_tag(
        "#{base_name}[]", "", :id => "#{base_id}_empty") +
      build_shell(method, options, "habtm_check_boxes_field") do
        choices.map do |c|
          field_id = "#{base_id}_#{c[1].to_s.downcase}"
          @template.content_tag(:div, :class => "field") do
            @template.check_box_tag(
              "#{base_name}[]", c[1],
              @object.send(method).include?(c[1]),
              :id => field_id
            ) + @template.label_tag(field_id, c[0])
          end
        end
      end
    end

    # Standard Rails date selector.
    #
    def date_select(method, options = {})
      options[:include_blank] ||= false
      options[:start_year]    ||= 1801
      options[:end_year]      ||= Time.now.year
      options[:label_for]       = "#{object_name}_#{method}_1i"
		  build_shell(method, options) { super }
    end

    ##
    # This differs from the Rails-default date_select in that it
    # submits three distinct fields for storage in three separate attributes.
    # This allows for partial dates (eg, "1984" or "October 1984").
    # See {FlexDate}[http://github.com/alexreisner/flex_date] for
    # storing and manipulating partial dates.
    #
    def multipart_date_select(method, options = {})
      options[:include_blank] ||= false
      options[:start_year]    ||= 1801
      options[:end_year]      ||= Time.now.year
      options[:prefix]          = object_name # for date helpers
      options[:label_for]       = "#{object_name}_#{method}_y"
		  build_shell(method, options) do
        [['y', 'year'], ['m', 'month'], ['d', 'day']].map{ |p|
          i,j = p
          value = @object.send(method.to_s + '_' + i)
          options[:field_name] = method.to_s + '_' + i
          eval("@template.select_#{j}(#{value.inspect}, options)")
        }.join(' ')
		  end
    end

    # Year select field. Takes options <tt>:start_year</tt> and
    # <tt>:end_year</tt>, and <tt>:step</tt>.
    #
    def year_select(method, options = {})
      options[:first] = options[:start_year] || 1801
      options[:last]  = options[:end_year] || Date.today.year
      integer_select(method, options)
    end

    # Integer select field.
    # Takes options <tt>:first</tt>, <tt>:last</tt>, and <tt>:step</tt>.
    #
    def integer_select(method, options = {})
      options[:step] ||= 1
      choices = []; i = 0
      (options[:first]..options[:last]).each do |n|
        choices << n if i % options[:step] == 0
        i += 1
      end
		  select method, choices, options
    end

    # Submit button with smart default text (if +value+ is nil uses "Create"
    # for new record or "Update" for old record).
    #
    def submit(value = nil, options = {})
      value = (@object.new_record?? "Create" : "Update") if value.nil?
      build_shell(value, options, 'submit_button') { super }
    end

    # Render a field label.
    #
    def label(method, text = nil, options = {})
      colon = false if options[:colon].nil?
      options[:for] = options[:label_for]
      required = options[:required]

      # remove special options
      options.delete :colon
      options.delete :label_for
      options.delete :required

      text = @template.send(:h, text.blank?? method.to_s.humanize : text.to_s)
      text << ':'.html_safe if colon
      text << @template.content_tag(:span, "*", :class => "required") if required
      super
    end

    # Render a field set (HTML fieldset tag). Takes the legend (optional), an
    # options hash, and a block in which fields are rendered.
    #
    def field_set(legend = nil, options = nil, &block)
      @template.content_tag(:fieldset, options) do
        (legend.blank?? "" : @template.content_tag(:legend, legend)) +
        @template.capture(&block)
      end
    end
    
    private # ---------------------------------------------------------------

    # Insert a field into its HTML "shell".
    #
    def build_shell(method, options, template = 'default_field') #:nodoc:

      # Build new options hash for custom label options.
      label_options = options.reject{ |i,j| !@@custom_label_options.include? i }

      # Build new options hash for custom field options.
      field_options = options.reject{ |i,j| !@@custom_field_options.include? i }

      # Remove custom options from options hash so things like
      # <tt>include_blank</tt> aren't added as HTML attributes.
      options.reject!{ |i,j| @@custom_options.include? i }

      locals = {
        :element     => yield,
        :label       => label(method, field_options[:label], label_options),
        :description => field_options[:description],
        :div_id      => "#{@object_name}_#{method}_field",
        :required    => field_options[:required],
        :decoration  => field_options[:decoration] || nil
      }
      send("#{template}_template", locals).html_safe
    end

    # Render default field template for all the following field methods:
    # "fields_for", "label", "text_field", "password_field", "hidden_field", "file_field", "text_area", 
    # "search_field", "telephone_field", "phone_field", "url_field", 
    # "email_field", "number_field", "range_field"
    # 
    # ==== Examples
    #   <%= jq_form_for(@post) do |f| %>
    #     <%= f.text_field :name %>
    #   <% end %>
    #
    #   #  =>(Ommiting form_for results)
    #   <div data-role="fieldcontain" id="post_name_field" class="field"> 
    #	    label for="post_name">Name</label><br /> 
    #     <input id="post_name" name="post[name]" size="30" type="text" /> 
    #	  </div>
    #  
    # You can pass a few other options for your input fields.
    # 
    # ==== Examples
    #   <%= f.text_field :name, :description => "Fill in your name", :required => true,
    #       :label => "Your Name", :decoration => 'basically a field' %>
    #   # => <div data-role="fieldcontain" id="post_name_field" class="field"> 
    #	    label for="post_name">Your Name<span class="required">*</span></label><br /> 
    #     <input id="post_name" name="post[name]" size="30" type="text" />basically a field
    #	  </div>
    #
    def default_field_template(l = {})
      <<-END
      <div data-role="fieldcontain" id="#{l[:div_id]}" class="field">
	      #{l[:label]}<br />
        #{l[:element]}#{l[:decoration]}
        #{"<p class=\"field_description\">#{l[:description]}</p>" unless l[:description].blank?}
	    </div>
	    END
    end

    # Render check box field template.
    #
    def check_box_field_template(l = {})
      <<-END
      <div data-role="fieldcontain" id="#{l[:div_id]}" class="field">
	      #{l[:element]} #{l[:label]} #{l[:decoration]}<br />
	      #{"<p class=\"field_description\">#{l[:description]}</p>" unless l[:description].blank?}
	    </div>
	    END
    end

    # Render single radio button. Note that this is the only field
    # template without an enclosing <tt><div class="field"></tt> because it
    # is intended for use only within the radio_buttons_template (plural).
    #
    def radio_button_choice_template(l = {})
      <<-END
      #{l[:element]} #{l[:label]}
	    END
    end

    # Render a group of radio buttons.
    #
    def radio_buttons_field_template(l = {})
      default_field_template(l)
    end

    # Render a group of HABTM check boxes.
    #
    def habtm_check_boxes_field_template(l = {})
      <<-END
      <div data-role="fieldcontain" id="#{l[:div_id]}" class="field">
	      #{l[:label]}<br />
        <div class="habtm_check_boxes">#{l[:element]}</div>#{l[:decoration]}
        #{"<p class=\"field_description\">#{l[:description]}</p>" unless l[:description].blank?}
	    </div>
	    END
    end

    # Render submit button template.
    #
    def submit_button_template(l = {})
      <<-END
      <div class="button">#{l[:element]}</div>
	    END
    end
    
  end
end