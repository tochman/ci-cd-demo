# frozen_string_literal: true

Given('the following news articles exist in our database:') do |table|
  table.hashes.each do |article_attributes|
    FactoryBot.create(:article, article_attributes)
  end
end

Given('the following users exist in our database:') do |table|
  table.hashes.each do |user_attributes|
    FactoryBot.create(:user, user_attributes)
  end
end
