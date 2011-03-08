require 'test_helper'

class FormBuilderTest < ActionView::TestCase  
  
  test 'text_field div wrapper should have data-role=fieldcontain' do
    test = jq_form_for @user do |f|
      f.text_field :name, :description => 'Hello World'
    end
    assert_match /data-role="fieldcontain"/, test
    assert_match /Hello World/, test
  end  
    
end
