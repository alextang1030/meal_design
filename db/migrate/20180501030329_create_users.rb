class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
	  t.string :user_id, limit: 50, primary: true
	  t.string :user_name, limit: 100, null: false
	  t.string :email
	  t.string :password
	  t.string :provider
	  t.string :provider_id
	  t.string :deleted_flag, limit: 1, default: "N"
      t.timestamps
    end
  end
end
