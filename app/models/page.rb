class Page < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :columns
  has_many :actions
  
  #scope columns
  scope  :new_columns, -> {self.columns.where('show_new = ?', 1 )}
  scope  :list_columns, -> {self.columns.where('show_list = ?', 1 )}
  scope  :search_columns, -> {self.columns.where('show_search = ?', 1 )}
  scope  :edit_columns, -> {self.columns.where('show_detail = ?', 1 )}
  
  #scope actions
  
  def execute_command
	connection = ActiveRecord::Base.connection;
	connection.select_all(command)
  end
  
end

