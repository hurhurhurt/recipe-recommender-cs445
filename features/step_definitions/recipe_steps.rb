When /^(?:|I )go to the (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end