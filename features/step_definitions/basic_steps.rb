Then('stop') do 
    binding.pry
end

Given("I wait {int} second(s)") do |seconds|
    sleep seconds
end

Then('show me the page') do
    save_and_open_page
end

When("I fill in {string} field with {string}") do |field, content|
    fill_in field, with: content
end

When("I click {string} button") do |button|
    click_button button
end

When("I click on {string}") do |element|
    click_on element
end

Given("I am logged in as {string}") do |email|
    @user = User.find_by(email: email)
    login_as(@user, scope: :user)
end

When("I click {string} button in the {string} section") do |element_text, section_name|
   within('#subscription') do
      click_on element_text 
   end
   @stripe_iframe = all('iframe[name=stripe_checkout_app]').last 
end

When("I fill in the stripe form field {string} with {string}") do |field_label, content|
    within_frame @stripe_iframe do 
        fill_in field_label, with: content
    end
end
  
When("I submit the stripe form") do
    within_frame @stripe_iframe do  
        find('.Section-button').click
    end
    sleep(3)
end

Then("the card got declined with message {string}") do |content|
    within_frame @stripe_iframe do
        within '.Popover-content' do
        expect(page).to have_content content
        end
    end
end