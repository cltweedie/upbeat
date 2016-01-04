Given(/^I have an account as a producer$/) do
  @producer = Producer.create!(email: "email@email.com", password: "password", password_confirmation: "password")
end

When(/^I choose to sign in$/) do
  page.find("#signin-button").click
end

Then(/^I will be taken to the sign\-in page$/) do
  expect(current_path).to eq new_producer_session_path
end

When(/^I fill in the form with valid sign\-in information$/) do
  fill_in "Email", with: "email@email.com"
  fill_in "Password", with: "password"
end

When(/^I sign in$/) do
  click_on "Log in"
end

Then(/^I will see a flash notice "(.*?)"$/) do |message|
  expect(page).to have_content message
end
