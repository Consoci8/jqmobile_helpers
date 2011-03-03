module MiscHelpers
  def assert_no_select(selector, value = nil)
    assert_select(selector, :text => value, :count => 0)
  end

  def swap(object, new_values)
    old_values = {}
    new_values.each do |key, value|
      old_values[key] = object.send key
      object.send :"#{key}=", value
    end
    yield
  ensure
    old_values.each do |key, value|
      object.send :"#{key}=", value
    end
  end
end
