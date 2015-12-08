class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :url
      t.integer :couch_id
      t.timestamps null: false
    end
  end
end
