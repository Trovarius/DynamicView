class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
	  t.references :page
	  t.string :title
	  t.string :hint
	  t.integer :column_type
	  t.boolean :required
	  t.boolean :show_list
	  t.boolean :show_edit
	  t.boolean :show_new
	  t.boolean :show_detail
	  t.integer	:command_type
	  t.text	:command
	  
      t.timestamps
    end
  end
end
