class CreateRepos < ActiveRecord::Migration[5.1]
  def change
    create_table :repos do |t|
      t.string :repo_name
      t.integer :repo_stars
      t.integer :repo_forks

      t.timestamps
    end
  end
end
