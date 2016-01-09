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

Given(/^I have an account as a seller$/) do
  @seller = Seller.create!(email: "email@email.com", password: "password", password_confirmation: "password")
end

Given(/^I'm on the my sounds page$/) do
  visit producer_sounds_path(@seller)
end

When(/^I choose to add a new sample pack$/) do
  click_on "Add sample pack"
end

Then(/^I will be taken to the new sample pack page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in the form with valid details$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^a new sample pack will exist$/) do
  pending # express the regexp above with the code you wish you had
end
