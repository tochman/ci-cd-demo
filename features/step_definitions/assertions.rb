# frozen_string_literal: true

Then('I should see a list of articles') do
  expect(page).to have_selector '#article-list'
end

Then('I should see {string}') do |expected_content|
  if @article.nil?
    expect(page).to have_text expected_content
  else
    within("#article_#{@article.id}") do
      expect(page).to have_text expected_content
    end
  end
end

Then('I should not see {string}') do |expected_content|
  if @article.nil?
    expect(page).not_to have_text expected_content
  else
    within("#article_#{@article.id}") do
      expect(page).not_to have_text expected_content
    end
  end
end

Then('I should see a link {string}') do |expected_text|
  expect(page).to have_link expected_text
end
