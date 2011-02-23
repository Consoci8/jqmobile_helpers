require 'test_helper'

class ToolbarsHelperTest < ActiveSupport::TestCase
  include JqmobileHelpers::ToolbarsHelper
  
  test "header toolbar title" do
    toolbar_title = header_toolbar_title('sazlin')
    assert_equal "<h1>sazlin</h1>", toolbar_title
  end

  test "header toolbar link" do
    toolbar_link = header_toolbar_link('Home','http://localhost:3000/',{'data-theme' => 'c', 'data-icon' => 'home', 'data-iconpos' => 'notext'})
    assert_equal "<a data-direction=\"reverse\" data-icon=\"home\" data-iconpos=\"notext\" data-theme=\"c\" href=\"http://localhost:3000/\">Home</a>", toolbar_link
  end


end
