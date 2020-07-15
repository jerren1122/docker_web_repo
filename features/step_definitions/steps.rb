When(/^the user navigates to the (.+) page$/) do |page_name|
  visit_page(page_class_name_for(page_name))
end

When(/^the user clicks (.*)$/) do |element|
  to_element(element).click!
end

Then(/^the user validates the url contains (.*)$/) do |content|
  expect((@browser.url).include?(content)).to eq true
end

Then(/^the user validates the element (.*) displays$/) do |element|
  expect((to_element(element).present?)).to eq true
end