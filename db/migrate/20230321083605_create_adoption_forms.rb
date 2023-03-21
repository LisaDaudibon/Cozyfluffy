class CreateAdoptionForms < ActiveRecord::Migration[7.0]
  def change
    create_table :adoption_forms do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone_number
      t.belongs_to :cat, index: true

      t.timestamps
    end
  end
end
