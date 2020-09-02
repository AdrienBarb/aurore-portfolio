class AddWorksDescriptionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :works_description, :text
  end
end
