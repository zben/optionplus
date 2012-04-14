When /^I visit homepage$/ do
  visit "/"

end

When /^I see the chart params form for ticker "([^"]*)"$/ do |ticker|
  page.shoud have_css('form')
  page.should have_css('input.ticker[value=SPY]')
end

When /^I see the chart for ticker "([^"]*)"$/ do |ticker|
  pending # express the regexp above with the code you wish you had
end

