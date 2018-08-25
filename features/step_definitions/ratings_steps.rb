Then("I click {string} on rating") do |value|
    within('#rating') do
        click_on value
    end
end