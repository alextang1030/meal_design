class CreateEventInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :event_invites do |t|
	  t.integer :event_id, limit: 8
	  t.string :user_id, limit: 50
	  t.string :status, default: "invited"
      t.timestamps
    end
  end
end
