class AddCamposToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :tipo2, :string
    add_column :searches, :tipo3, :string
  end
end
