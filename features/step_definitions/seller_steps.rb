When(/^I choose to view my account settings$/) do
  click_on @producer.email
  click_on "my account"
end

Then(/^I will be taken to the account settings page$/) do
  expect(page).to have_content "account settings"
end

When(/^I choose to register as a seller$/) do
  page.find('#seller-register').click
end

Then(/^I will see a modal asking me to confirm$/) do
  expect(page).to have_content "Would you like to register as a seller?"
end

When(/^I confirm$/) do
  click_on "Confirm"
end

Then(/^I will have an account as a seller$/) do
  expect(Seller.all.length).to eq 1
end
