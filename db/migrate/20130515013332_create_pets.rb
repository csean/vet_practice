class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :breed
      t.date :dob
      t.integer :weight

      t.timestamps
    end
  end
end
