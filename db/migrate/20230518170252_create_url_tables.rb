class CreateUrlTables < ActiveRecord::Migration[7.0]
  def change
    create_table :url_tables do |t|
      t.string :long_url
      t.string :url_id

      t.timestamps
    end
  end
end
