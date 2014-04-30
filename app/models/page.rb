class Page < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :columns
  has_many :actions
  
  #scope actions
  default_scope :include => [:columns, :actions]
  
  require "base64"
  
  def execute_command(where = "")
	connection = ActiveRecord::Base.connection;
	sql = command
	sql = "#{command} where #{where}" unless  where.nil? || where.empty?
	
	logger.info sql
	connection.select_all(sql)
  end
  
  def key_url(params)
	var = []
	
	self.columns.is_key.each do |column_key|
		var << "#{column_key.field}='%s'" %  params[column_key.field].to_s if params.has_key? column_key.field 
	end
	
	Base64.encode64(var.join("|"))
  end
  
  def create_where_by_request(request)
	request
  end
  
end



