class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.text :description
      t.boolean :adoption

      t.timestamps
    end
  end
end
