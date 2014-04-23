class Page < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :columns
  has_many :actions
  
  #scope actions
  
  def execute_command
	connection = ActiveRecord::Base.connection;
	connection.select_all(command)
  end
  
end

