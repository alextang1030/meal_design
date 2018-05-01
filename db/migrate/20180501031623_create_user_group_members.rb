class CreateUserGroupMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_group_members do |t|
	  t.integer :group_id, limit: 5
	  t.string :user_id, limit: 50
	  t.string :user_role, default: "member"
	  t.string :deleted_flag, limit: 1, default: "N"
      t.timestamps
    end
  end
end
