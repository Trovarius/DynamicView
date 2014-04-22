class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
	  t.string :name
	  t.string :title
	  t.integer	:command_type
	  t.text	:command
	  t.string	:hint

      t.timestamps
    end
  end
end
