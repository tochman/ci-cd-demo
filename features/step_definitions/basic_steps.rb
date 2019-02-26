# frozen_string_literal: true

When('I visit the site') do
  visit '/'
end

Given('(when )I am reading/looking (at )the article titled {string}') do |title|
  @article = Article.find_by_title(title)
end

Given('I fill in {string} with {string}') do |element, value|
  within("#article_#{@article.id}") do
    fill_in element, with: value
  end
end

Given("I click (on ){string}") do |element_text|
  if @article.nil?
    click_on element_text
  else
    within("#article_#{@article.id}") do
      click_on element_text
    end
  end
end

Given("I focus on the comments") do
  @article = nil
  # remove_instance_variable(:@article)
end


Then("show me the page") do 
  save_and_open_page
end

Given("I'm/I logged/log in as {string}") do |email|
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end

Given /^I log out$/ do
  logout
end


