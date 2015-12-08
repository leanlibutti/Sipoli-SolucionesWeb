class CreateEarns < ActiveRecord::Migration
  def change
    create_table :earns do |t|
      t.date :fech_ing
      t.date :fech_egr
      t.float :valor

      t.timestamps null: false
    end
  end
end
