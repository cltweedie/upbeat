When(/^I choose to view my account settings$/) do
  click_on "my account"
end

Then(/^I will be taken to the account settings page$/) do
  expect(page).to have_content "account settings"
end

When(/^I choose to register as a seller$/) do
  click_on "Register as seller"
end

Then(/^I will have an account as a seller$/) do
  expect(Seller.all.length).to eq 1
end
