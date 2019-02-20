Then("I should see a list of articles") do
  expect(page).to have_selector '#article-list'
end

Then("I should see {string}") do |expected_content|
  within("#article_#{@article.id}") do
    expect(page).to have_text expected_content
  end
end

Then("I should not see {string}") do |expected_content|


  within("#article_#{@article.id}") do
    expect(page).not_to have_text expected_content
  end
end