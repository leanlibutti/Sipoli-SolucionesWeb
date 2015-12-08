class AddNuevosToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :contenido2, :string
    add_column :searches, :contenido3, :string
  end
end
