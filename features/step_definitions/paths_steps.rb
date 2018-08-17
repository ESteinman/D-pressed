When("I am on the {string} page") do |page_name|
    visit page_path(page_name)
end

When("I should be redirected to the {string} page") do |page|
    visit page_path(page)    
end

Given("I visit the Create article page") do
    visit new_article_path
end

def page_path(path)
    if path == 'This is so sad'
        article_title = Article.find_by(title: path)
        article_path(article_title)
    elsif path == 'Registration'
        new_user_registration_path
    elsif path == 'My account'
        user_path(@user)
    else
        root_path
    end
end


  
