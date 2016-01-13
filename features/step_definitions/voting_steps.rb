Given(/^I'm signed in$/) do
  visit new_producer_session_path
  fill_in "Email", with: "email@email.com"
  fill_in "Password", with: "password"
  click_on "Log in"
end

Given(/^A sound exists$/) do
  @sound = Sound.new(title: "Sound")
  @sound.file = File.open("spec/support/test.wav")
  @sound.producer = Producer.create!(email: Faker::Internet.email, password: "password", password_confirmation: "password")
  @sound.save!
end

Given(/^I'm on the sound show page$/) do
  visit sound_path(@sound)
end

When(/^I upvote a sound$/) do
  page.find('.upvote').click
end

Then(/^The sound will have a vote$/) do
  sleep 0.1
  expect(@sound.reload.votes_for.size).to eq 1
end

Then(/^I will be able to see the total votes on the page$/) do
  sleep 0.1
  within ".voting" do
    expect(page).to have_content "1"
  end
end
