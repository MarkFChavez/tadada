class AddFkToDiscussions < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE discussions
      ADD CONSTRAINT fk_discussions_to_users FOREIGN KEY (user_id)
      REFERENCES users (id)
    SQL
  end
end
