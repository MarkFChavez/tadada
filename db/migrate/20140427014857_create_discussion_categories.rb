class CreateDiscussionCategories < ActiveRecord::Migration
  def change
    create_table :discussion_categories do |t|
      t.integer :discussion_id
      t.integer :category_id

      t.timestamps
    end
    add_index :discussion_categories, :discussion_id
    add_index :discussion_categories, :category_id
  end
end
