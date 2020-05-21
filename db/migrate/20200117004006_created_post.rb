class CreatedPost < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
    add_index :posts, [:url], unique: true
  end
end
