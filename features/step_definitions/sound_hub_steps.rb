Given(/^I have uploaded a sound$/) do
  @sound = Sound.new(title: "Sound")
  @sound.file = File.open("spec/support/test.wav")
  @sound.instrument = Instrument.create!(name: "Drums")
  @sound.category = Category.create!(name: "Loops")
  @sound.producer = @producer
  @sound.save!
end

Given(/^I'm on the sounds index page$/) do
  visit sounds_path
end

When(/^I choose to view my sounds$/) do
  click_on "my sounds"
end

Then(/^I will be taken to the my sounds page$/) do
  expect(current_path).to eq producer_sounds_path(@producer)
end

Then(/^I will be able to see my sounds$/) do
  expect(page).to have_content @sound.title
end

Given(/^I'm currently on the my sounds page$/) do
  visit producer_sounds_path(@producer)
end

When(/^I choose to add a new sound$/) do
  click_on "New sound"
end

Then(/^I will be taken to the new sound page$/) do
  expect(current_path).to eq new_sound_path
end

When(/^I fill in the new sound form with valid details$/) do
  fill_in "Title", with: "Sound 1"
end

When(/^choose an audio file to upload$/) do
  attach_file(:File, "#{Rails.root}/features/upload-files/sound.wav")
end

When(/^I submit the new sound form$/) do
  click_on "Upload Sound"
end

Then(/^The sound will be created$/) do
  expect(Sound.all.length).to eq 1
  expect(Sound.all.first.title).to eq "Sound 1"
end

Then(/^I will be taken to the sound show page$/) do
  expect(page).to have_content "Sound 1"
end

When(/^I choose to delete my sound$/) do
  find("#delete_sound_#{@sound.id}").click
end

Then(/^I will be shown a modal asking "(.*?)"$/) do |message|
  expect(page).to have_content message
end

When(/^I choose to confirm$/) do
  click_on "Confirm Delete"
end

Then(/^The sound should be deleted$/) do
  sleep 0.1
  expect(Sound.all.length).to eq 0
end

Then(/^I will no longer see it on the page$/) do
  expect(page).not_to have_content @sound.title
end

When(/^I choose to edit my sound$/) do
  find("#edit_sound_#{@sound.id}").click
end

Then(/^I will be taken to the sound edit page$/) do
  expect(current_path).to eq edit_sound_path(@sound)
end

When(/^I change the title of the sound$/) do
  fill_in "Title", with: "New sound title"
end

When(/^submit the edit form$/) do
  click_on "Update Sound"
end

Then(/^the sound will be edited$/) do
  expect(@sound.reload.title).to eq "New sound title"
end
