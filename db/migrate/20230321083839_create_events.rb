class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.text :description
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
