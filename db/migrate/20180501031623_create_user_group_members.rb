class CreateUserGroupMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_group_members do |t|

      t.timestamps
    end
  end
end
