class AddColumnsToSources < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :place_of_pub, :string
    add_column :sources, :description, :string
    add_column :sources, :image_url, :string
  end
end
