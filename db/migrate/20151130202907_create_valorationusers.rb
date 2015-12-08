class CreateValorationusers < ActiveRecord::Migration
  def change
    create_table :valorationusers do |t|
      t.integer :user_id
      t.integer :userValora_id
      t.integer :valor

      t.timestamps null: false
    end
  end
end
