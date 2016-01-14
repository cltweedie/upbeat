Given(/^a sample pack exists$/) do
  @seller = Seller.create!(email: "seller@email.com", password: "password", password_confirmation: "password")
  @sample_pack = SamplePack.new(title: "Tech house", price: 4.99, file: File.open('features/upload-files/samplepack.zip'))
  @sample_pack.seller = @seller
  @sample_pack.save!
end

Given(/^I'm on the sample packs index page$/) do
  visit sample_packs_path
end

When(/^I choose to purchase a sample pack$/) do
  click_on "Pay with Card"
end

#capybara doesn't seem to be finding the stripe form
# Then(/^I will be show the form to enter my credit card details$/) do
#   sleep 3
#   expect(page).to have_content "Tech house sample pack"
#   expect(page).to have_css "form"
# end

# When(/^I fill in the form with valid information$/) do
#   fill_in '#email', with: "test@test.com"
#   fill_in '#card_number', with: "424242424242"
#   fill_in '#cc-exp', with: "1119"
#   fill_in '#cc-csc', with: "111"
#   click_on '#submitButton'
# end
