class AddImagesToCats < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :image_url, :string
  end
end
