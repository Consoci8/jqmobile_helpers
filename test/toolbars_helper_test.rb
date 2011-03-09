require 'test_helper'

class ToolbarsHelperTest < ActiveSupport::TestCase
  include JqmobileHelpers::ToolbarsHelper
  
  def request
    request = Rack::Request.new(Rack::MockRequest.env_for("http://localhost:3000/posts"))
  end

  test "header toolbar title" do
    toolbar_title = header_toolbar_title('sazlin')
    assert_equal "<h1>sazlin</h1>", toolbar_title
  end

  test "header toolbar link" do
    toolbar_link = header_toolbar_link('Home','http://localhost:3000/',{'data-theme' => 'c', 'data-icon' => 'home', 'data-iconpos' => 'notext'})
    assert_equal "<a data-direction=\"reverse\" data-icon=\"home\" data-iconpos=\"notext\" data-theme=\"c\" href=\"http://localhost:3000/\">Home</a>", toolbar_link
  end

  test "navbar bar container with navbar link" do
    
    navbar = navbar_bar([navbar_link('list view','http://localhost:3000/posts',{'data-theme' => 'c','data-icon' => 'gear'})])
    assert_equal "<div data-role=\"navbar\"><ul><li><a class=\"ui-btn-active\" data-icon=\"gear\" data-theme=\"c\" href=\"http://localhost:3000/posts\">list view</a></li></ul></div>", navbar
  end

end
