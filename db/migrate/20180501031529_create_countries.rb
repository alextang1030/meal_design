class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
	  t.string :code_name
	  t.string :deleted_flag, limit: 1, default: "N"
      t.timestamps
    end
  end
end
