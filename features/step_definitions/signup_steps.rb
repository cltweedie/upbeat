Given(/^I'm on the homepage$/) do
  visit root_path
end

When(/^I choose to sign up$/) do
  click_on "Sign Up"
end

Then(/^I will be taken to the sign\-up page$/) do
  expect(current_path).to eq new_producer_registration_path
end

When(/^I fill in the form with valid sign\-up information$/) do
  fill_in 'Email', with: Faker::Internet.email
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
end

When(/^I sign up$/) do
  click_button 'Sign up'
end

Then(/^a producer will be created$/) do
  expect(Producer.count).to eq 1
end

Then(/^I will be taken to the sounds index page$/) do
  expect(current_path).to eq sounds_path
end

Then(/^I will receive a welcome email$/) do
  expect(ActionMailer::Base.deliveries.length).to eq 1
end
