class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.integer :age
      t.integer :agency_id

      t.timestamps
    end
  end
end
