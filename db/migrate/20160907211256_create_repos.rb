class CreateRepos < ActiveRecord::Migration[5.0]
  def change
    create_table :repos do |t|
      t.string :name
      t.text :remote_path
      t.string :buildpack

      t.timestamps
    end
  end
end
