class Action < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :page
  
  def execute
	 
  end
end
