# frozen_string_literal: true

Given('the following news articles exist in our database:') do |table|
  table.hashes.each do |article_attributes|
    Article.create(title: article_attributes[:title], content: article_attributes[:content])
  end
end
