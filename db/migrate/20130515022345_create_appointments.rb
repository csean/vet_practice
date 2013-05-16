class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time
      t.datetime :appointment_end_time
      t.string :reason_for_visit
      t.boolean :requires_reminder
      t.references :pet
      t.references :veterinary

      t.timestamps
    end
    add_index :appointments, :pet_id
    add_index :appointments, :veterinary_id
  end
end
