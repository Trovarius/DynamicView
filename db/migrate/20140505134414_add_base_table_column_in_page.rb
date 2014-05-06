class AddBaseTableColumnInPage < ActiveRecord::Migration
  def up
	add_column :pages, :base_table, :string, null: false
  end

  def down
  end
end
