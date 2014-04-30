class QueryModel
	require 'sequel'
	#DB = Sequel.connect('mysql2://root@localhost/DynamicViews_development')
	
	attr_accessor :table_name, :db
	
	def initialize(table_name)
		@table_name = table_name
		@db = get_database()
	end
	
	def get_table
		@db.from(@table_name.to_sym)
	end
	
	def get_database
		config = Rails.configuration.database_configuration
		
		Sequel.connect(:adapter => 'mysql2', 
							 :user => config[Rails.env]["username"], 							 
							 :host => config[Rails.env]["host"], 
							 :database => config[Rails.env]["database"]
							)
	end
end