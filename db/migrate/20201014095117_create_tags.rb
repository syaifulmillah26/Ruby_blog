class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :description
      t.boolean :done
      t.belongs_to :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
