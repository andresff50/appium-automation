Then(/^Left unit picker value should be "([^"]*)"$/) do |value|
  picker_text = find_elements(:id, "select_unit_spinner")[0].text
  if picker_text != value
    fail("Expected unit picker value is #{value}, actual value is #{picker_text}")
  end
end

Then(/^Right unit picker value should be "([^"]*)"$/) do |value|
  array_of_elements = find_elements(:id, "select_unit_spinner")
  picker_text = array_of_elements[1].text
  if picker_text != value
    fail("Expected unit picker value is #{value}, actual value is #{picker_text}")
  end
end

Then(/^Show all button should be (disabled|enabled)$/) do |state|
  button_state = find_element(:id, "btn_show_all").enabled?

  if state == "enabled"
    fail("Expected element to be enabled") if !button_state
  elsif state == "disabled"
    fail("Expected element to be disabled") if button_state
  end
end

When("I type {string} on application keyboard") do |source_value|
  digits = source_value.split("")
  sleep 3
  digits.each do |digit|
    find_element(:id, "keypad").find_element(:xpath, "//android.widget.Button[@text='#{digit}']").click
  end
  
  value_to_validate = find_element(:id, "source_value").text
  if value_to_validate != source_value
    fail("Expected source value #{source_value}, actual value is #{value_to_validate}")
  end
end

Then("I should see result as {string}") do |target_value|
  target_value_to_validate = find_element(:id, "target_value").text
  if target_value_to_validate != target_value
    fail("Expected target value #{target_value}, actual value is #{target_value_to_validate}")
  end
end

Then("I press on Add to favorites icon") do
  find_element(:id, "action_add_favorites").click
end

Then("I press on Favorite conversion") do
  find_element(:xpath, "//*[contains(@text, 'Favorite conversions')]").click
end

Then("I verify {string} added to Favorite conversions list") do |unit_type|
  item_text = find_element(:id, "favorites_item_hint").text
  if unit_type != item_text
    fail("cannot find #{unit_type} in favorite list")
  end
end

Then("I select {string} from left unit picker") do |value|
  find_elements(:id, "select_unit_spinner")[0].click
  find_in_list(value)
end

Then("I press on main button") do
  find_element(:accessibility_id, "Open navigation drawer").click
end

Then("I select {string} from menu") do |value|
  find_element(:xpath, "//*[contains(@text, '#{value}')]").click
end

Then("I select {string} from right unit picker") do |value|
  find_elements(:id, "select_unit_spinner")[1].click
  find_in_list(value)
end

When("I press on switch units button") do
  find_element(:id, "img_switch").click
end