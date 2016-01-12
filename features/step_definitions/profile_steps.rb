When(/^I choose to view my profile$/) do
  click_on @producer.email
  click_on "my profile"
end

Then(/^I will be taken to the my profile page$/) do
  expect(current_path).to eq producer_profile_path(@producer)
  expect(page).to have_content "Username"
  expect(page).to have_content "Bio"
end

Given(/^I'm on my profile page$/) do
  visit producer_profile_path(@producer)
end

When(/^I choose to edit my profile$/) do
  click_on "Edit profile"
end

Then(/^I will be taken to the edit profile page$/) do
  expect(current_path).to eq edit_producer_profile_path(@producer)
end

When(/^I edit a field$/) do
  fill_in "Username", with: "username1"
end

When(/^submit the form$/) do
  click_on "Save changes"
end

Then(/^My profile will be updated$/) do
  expect(@producer.profile.reload.username).to eq "username1"
end
