class CreatedGitCommitHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :git_commit_histories do |t|
      t.string :commit_url, null: false
      t.timestamps
    end
    add_index :git_commit_histories, [:commit_url], unique: true
  end
end
