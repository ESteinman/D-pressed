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
    click_on(element)
end

Given("I am logged in as {string}") do |email|
    @user = User.find_by(email: email)
    login_as(@user, scope: :user)
end

Given("I visit the site from {string}") do |location|

    case location
    when 'Stockholm'
        coords = [59.334591, 18.063240]
    when 'Täby'
        coords = [59.4439, 18.06872]
    else
        coords = [57.708870, 11.974560]
    end 
    visit root_path
    page.execute_script("setCookie('location', '#{coords}')")
    visit root_path
end

