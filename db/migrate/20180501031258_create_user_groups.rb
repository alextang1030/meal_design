class CreateUserGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_groups do |t|
	  t.string :user_id, limit: 50
	  t.string :group_name
	  t.string :deleted_flag, limit: 1, default: "N"
      t.timestamps
    end
  end
end
