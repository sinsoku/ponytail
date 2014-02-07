class ChangeColumnOptionToBook < ActiveRecord::Migration
  def change
    change_column :books, :title, :string, limit: 100, default: 'no title', null: false
    add_column :books, :price, :decimal, precision: 5, scale: 2
  end
end
