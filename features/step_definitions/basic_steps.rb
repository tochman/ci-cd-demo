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

Given("I click {string}") do |element_text|
  within("#article_#{@article.id}") do
    click_on element_text
  end
end

Then("show me the page") do 
  save_and_open_page
end
