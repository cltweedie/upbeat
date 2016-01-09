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
  click_on "New pack"
end

Then(/^I will be taken to the new sample pack page$/) do
  expect(current_path).to eq new_sample_pack_path
end

When(/^I fill in the form with valid details$/) do
  fill_in "Title", with: "Sample Pack 1"
  save_and_open_page
  attach_file(:File, "#{Rails.root}/features/upload-files/samplepack.zip")
end

When(/^I submit the sample pack$/) do
  click_on "Add sample pack"
end

Then(/^a new sample pack will exist$/) do
  expect(SamplePack.all.length).to eq 1
  expect(SamplePack.first.title).to eq "Sample Pack 1"
end

Then(/^I will be taken to the sample pack show page$/) do
  expect(page).to have_content "Sample Pack 1"
end

