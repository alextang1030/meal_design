class CreateSuburbs < ActiveRecord::Migration[5.2]
  def change
    create_table :suburbs do |t|
	  t.integer :country_id, limit: 5
	  t.integer :state_id, limit: 5
	  t.string :code_name
	  t.string :deleted_flag, limit: 1, default: "N"
      t.timestamps
    end
  end
end
