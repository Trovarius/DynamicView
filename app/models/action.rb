# == Schema Information
#
# Table name: actions
#
#  id                    :integer          not null, primary key
#  page_id               :integer
#  title                 :string
#  hint                  :string
#  action_type           :integer
#  implementation        :string
#  implementation_params :string
#  created_at            :datetime
#  updated_at            :datetime
#

class Action < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :page
  
  def execute(params)
	connection = ActiveRecord::Base.connection;
	sql_param = "select " + create_sql_variables_from_page_columns(params).join(' , ') 
	
	#query = implementation % Hash[params.map{ |k, v| [k.to_sym, v] }]
	
	query = sql_param + "; " + implementation + ";"
	
	logger.info query 
	connection.execute(query)
  end
  
  private
  
  def create_sql_variables_from_page_columns(params)
	variables = []
	
	self.page.columns.each do |column|
		if params.has_key?(column.field)
			variables << "#{column.sql_variable(params[column.field])}"
		end
	end
	
	variables
  end
  
end
