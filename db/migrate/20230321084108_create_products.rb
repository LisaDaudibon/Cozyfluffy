class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
