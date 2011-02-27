require 'test_helper'

class ButtonsHelperTest < ActiveSupport::TestCase
  include JqmobileHelpers::ButtonsHelper

  test "button link helper" do
    jq_button_link = button_link("New Post", "http://google.com",{'data-theme' => 'c', 'data-icon' => 'plus', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"plus\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">New Post</a>", jq_button_link
  end

  test "delete button link helper" do
    jq_delete_button_link = delete_button_link("Delete", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"delete\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">Delete</a>", jq_delete_button_link
  end

  test "left button link helper" do
    jq_left_button_link = left_button_link("Back", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'left'})
    assert_equal "<a data-icon=\"arrow-l\" data-iconpos=\"left\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">Back</a>", jq_left_button_link
  end

  test "right button link helper" do
    jq_right_button_link = right_button_link("Proceed", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"arrow-r\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">Proceed</a>", jq_right_button_link
  end

  test "up button link helper" do
    jq_up_button_link = up_button_link("Top", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'top'})
    assert_equal "<a data-icon=\"arrow-u\" data-iconpos=\"top\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">Top</a>", jq_up_button_link
  end

  test "down button link helper" do
    jq_down_button_link = down_button_link("bottom", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'bottom'})
    assert_equal "<a data-icon=\"arrow-d\" data-iconpos=\"bottom\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">bottom</a>", jq_down_button_link
  end

  test "plus button link helper" do
    jq_plus_button_link = plus_button_link("Add as friend", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"plus\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">Add as friend</a>", jq_plus_button_link
  end

  test "minus button link helper" do
    jq_minus_button_link = minus_button_link("Remove friend", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"minus\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">Remove friend</a>", jq_minus_button_link
  end

  test "check button link helper" do
    jq_check_button_link = check_button_link("Check", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"check\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">Check</a>", jq_check_button_link
  end

  test "gear button link helper" do
    jq_gear_button_link = gear_button_link("gear", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"gear\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">gear</a>", jq_gear_button_link
  end

  test "refresh button link helper" do
    jq_refresh_button_link = refresh_button_link("refresh", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"refresh\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">refresh</a>", jq_refresh_button_link
  end

  test "forward button link helper" do
    jq_forward_button_link = forward_button_link("forward", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"forward\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">forward</a>", jq_forward_button_link
  end

  test "back button link helper" do
    jq_back_button_link = back_button_link("back", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"back\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">back</a>", jq_back_button_link
  end

  test "grid button link helper" do
    jq_grid_button_link = grid_button_link("grid", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"grid\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">grid</a>", jq_grid_button_link
  end

  test "star button link helper" do
    jq_star_button_link = star_button_link("star", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"star\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">star</a>", jq_star_button_link
  end

  test "alert button link helper" do
    jq_alert_button_link = alert_button_link("alert", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"alert\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">alert</a>", jq_alert_button_link
  end

  test "info button link helper" do
    jq_info_button_link = info_button_link("info", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"info\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">info</a>", jq_info_button_link
  end

  test "home button link helper" do
    jq_home_button_link = home_button_link("home", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"home\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">home</a>", jq_home_button_link
  end

  test "search button link helper" do
    jq_search_button_link = search_button_link("search", "http://google.com",{'data-theme' => 'c', 'data-iconpos' => 'right'})
    assert_equal "<a data-icon=\"search\" data-iconpos=\"right\" data-role=\"button\" data-theme=\"c\" href=\"http://google.com\">search</a>", jq_search_button_link
  end

  test "group button helper" do
    jq_group_button = group_button("<a data-icon=\"home\" data-iconpos=\"right\" data-role=\"button\" href=\"/buttons\">home</a>",{'data-type' => 'horizontal'})
    assert_equal "<div data-role=\"controlgroup\" data-type=\"horizontal\"><a data-icon=\"home\" data-iconpos=\"right\" data-role=\"button\" href=\"/buttons\">home</a></div>", jq_group_button
  end

end

