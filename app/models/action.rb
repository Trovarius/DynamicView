class Action < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :page
  
  def execute(params)
	connection = ActiveRecord::Base.connection;
	#sql_param = "select " + params.map{ |k,v| "@#{k}=#{v}" }.join(' , ')
	query = implementation % Hash[params.map{ |k, v| [k.to_sym, v] }]
	logger.info query 
	connection.execute(query)
  end
end
