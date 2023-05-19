class UniqueShortId < ActiveRecord::Migration[7.0]
  def change
    add_index :url_tables, :url_id, unique:true
  end
end
