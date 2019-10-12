class CreateMarkers < ActiveRecord::Migration[6.0]
  def change
    create_table :markers do |t|
      t.string :title, null: false
      t.float :lat, null: false
      t.float :lng, null: false
      t.string :desc
      t.json :info

      t.timestamps
    end
  end
end
