# == Schema Information
#
# Table name: pages
#
#  id           :integer          not null, primary key
#  name         :string
#  title        :string
#  command_type :integer
#  command      :text
#  hint         :string
#  created_at   :datetime
#  updated_at   :datetime
#  base_table   :string           not null
#

class Page < ActiveRecord::Base
  require "base64"
  has_many :columns
  has_many :actions
  
  #scope actions
  #default_scope { includes(:columns, :actions) }
  
  def cmd
  	@page_model ||= PageModel.new(base_table, command)
  end
  
  def execute_command(where = "")
	  self.cmd.select_command(where)
  end
  
  def key_url(params)
    var = []
	
    self.columns.is_key.each do |column_key|
		  logger.info  column_key
		  var << "#{column_key.field}='%s'" %  params[column_key.field.to_sym].to_s if params.has_key? column_key.field.to_sym 
    end

    Base64.encode64(var.join("|"))
  end
  
  def create_where_by_request(request)
    "where #{request.gsub('|', ' and ')}"
  end
  
end



