class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
	  t.references :page
	  t.string :title
	  t.string :hint
	  t.integer		:action_type
	  t.string	:implementation
	  t.string	:implementation_params		
	  
      t.timestamps
    end
  end
end
