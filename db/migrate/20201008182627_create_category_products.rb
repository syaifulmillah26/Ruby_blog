class CreateCategoryProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :category_products do |t|
      t.string :category_product
      t.integer :category_product_id

      t.timestamps
    end
  end
end
