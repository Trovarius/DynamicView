require 'sequel'
config = Rails.configuration.database_configuration
		
DB = Sequel.connect(:adapter => 'mysql2', 
	 :user => config[Rails.env]["username"], 							 
	 :host => config[Rails.env]["host"], 
	 :database => config[Rails.env]["database"]
	)