Then("I press on create your first conversion button") do
    find_element(:id, "btn_new_custom_conversion").click
    sleep 3
end

Then("I type {string} as custom conversion name") do |name|
    find_element(:id, "edit_custom_conversion_category_name").send_keys(name)
end

When("I press on new unit button") do
    find_element(:id, "btn_new_custom_unit").click
    sleep 3
end

Then("I type {string} as unit name") do |unit_name|
    find_element(:id, "edit_custom_conversion_unit_dtls_name").send_keys(unit_name)
end

Then("I type {string} as unit symbol") do |symbol|
    find_element(:id, "edit_custom_conversion_unit_dtls_symbol").send_keys(symbol)
end

Then("I type {string} as unit value") do |value|
    find_element(:id, "edit_custom_conversion_unit_dtls_value").send_keys(value)
end

Then("I press submit checkmark on custom conversions screen") do
    find_element(:id, "action_confirm_custom_unit").click
end

When("I press on OK button on Custom conversions screen") do
    sleep 3
    find_element(:id, "btn_custom_conversion_details_ok").click
end

Then("I verify {string} added to custom conversions list") do |conversion_name|
    find_element(:xpath, "//*[contains(@text, #{conversion_name})]")
end

Then("I press on search icon") do
    find_element(:accessibility_id, "Open navigation drawer").click
    find_element(:id, "action_search").click
end

Then("I type {string} in search field") do |text|
    find_element(:id, "search_src_text").send_keys(text)
end

Then("I press return button on soft keyboard") do
    Appium::TouchAction.new.tap(x: 0.99, y: 0.99, count: 1).perform
end
  
Then("I see {string} as a current unit converter") do |current_unit|
    find_element(:id, "action_bar").find_element(:xpath, "//android.widget.TextView[@text='#{current_unit}']")
end