class AddCategoryProductIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :category_product_id, :integer
  end
end
