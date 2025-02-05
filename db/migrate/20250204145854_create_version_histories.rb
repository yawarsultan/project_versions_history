class CreateVersionHistories < ActiveRecord::Migration[7.2]
  def change
    create_table :version_histories do |t|
      t.text :body
      t.references :project, null: false, foreign_key: true
      t.string :version_type
      t.string :title

      t.timestamps
    end
  end
end
