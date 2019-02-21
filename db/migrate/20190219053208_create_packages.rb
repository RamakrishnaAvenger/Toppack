class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :repo_name
      t.string :package_name

      t.timestamps
    end
  end
end
