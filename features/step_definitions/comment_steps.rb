When(/^I choose to leave a comment$/) do
  find("#new-comment-button").click
end

Then(/^I will be shown a comment box$/) do
  expect(page).to have_content "Enter a comment"
end

When(/^I enter a valid body$/) do
  fill_in "new-comment-body", with: "This is a comment."
end

When(/^submit the comment$/) do
  click_on "Submit"
end

Then(/^the sound will have a comment$/) do
  sleep 0.1
  expect(@sound.reload.comments.length).to eq 1
  expect(page).to have_content "This is a comment."
end
