class CreateVeterinaries < ActiveRecord::Migration
  def change
    create_table :veterinaries do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :school
      t.integer :date_graduated

      t.timestamps
    end
  end
end
