class CreateEventInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :event_invites do |t|

      t.timestamps
    end
  end
end
