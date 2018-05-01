class CreateUserLoginTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :user_login_tokens, id: false do |t|
      t.string :token_id, limit: 50, primary: true
	  t.string :user_id, limit: 50
	  t.string :user_ip
	  t.string :user_agent
	  t.string :device_id
	  t.datetime :expried_date
      t.timestamps
    end
  end
end
