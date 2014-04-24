class AddOrderInColumn < ActiveRecord::Migration
  def change
	add_column :columns, :order, :integer
	add_column :columns, :is_key, :boolean
  end

  def down
  end
end
