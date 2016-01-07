Given(/^I have uploaded a sound$/) do
  @sound = Sound.new(title: "Sound")
  @sound.file = File.open("spec/support/test.wav")
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
