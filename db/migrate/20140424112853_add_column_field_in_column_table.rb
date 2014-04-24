class AddColumnFieldInColumnTable < ActiveRecord::Migration
  def change
	add_column :columns, :field, :string
  end

  def down
  end
end
