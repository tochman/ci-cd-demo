class AddRestrictedToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :restricted, :boolean, dafault: false
  end
end
