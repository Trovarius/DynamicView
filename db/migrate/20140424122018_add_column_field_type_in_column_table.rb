class AddColumnFieldTypeInColumnTable < ActiveRecord::Migration
  def change
	add_column :columns, :field_type, :string, null: false
  end

  def down
  end
end
