require 'sequel'

class PageModel
	#DB = Sequel.connect('mysql2://root@localhost/DynamicViews_development')
	
	attr_accessor :table_name, :command
	
	def initialize(table_name, command = "")
		@table_name, @command = table_name, command
	end
	
	
	def has_command?
		!(@command.nil? || @command.empty?)
	end
	
	def select_command(where = "")
		
		if has_command?
			DB["#{@command} #{where}"].all
		elsif !(where.nil? || where.empty?)
			DB[table_name.to_sym].where(where).all
		else
			DB[table_name.to_sym].all
		end
		
	end
end