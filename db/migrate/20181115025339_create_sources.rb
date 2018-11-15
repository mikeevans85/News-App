class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :api_url
      t.string :source_language

      t.timestamps
    end
  end
end
