class Column < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :page
  
  #scope columns
  scope  :new_columns, -> {where('show_new = ?', 1 )}
  scope  :list_columns, -> {where('show_list = ?', 1 )}
  scope  :search_columns, -> {where('show_search = ?', 1 )}
  scope  :edit_columns, -> {where('show_detail = ?', 1 )}
end
