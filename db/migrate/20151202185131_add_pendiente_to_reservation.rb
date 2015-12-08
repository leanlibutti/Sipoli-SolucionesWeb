class AddPendienteToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :pendiente, :boolean
  end
end
