class Column < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :page
  
  #scope columns
  default_scope order('columns.order asc')
  scope  :new_columns, -> {where('show_new = ?', 1 )}
  scope  :list_columns, -> {where('show_list = ? ', 1 )}
  scope  :search_columns, -> {where('show_search = ? ', 1  )}
  scope  :edit_columns, -> {where('show_detail = ? ', 1 )}
  scope  :is_key, ->{where('is_key = ?', 1)}
  
  def sql_variable(value = nil)
	val = value.nil? ? "null" :"cast('#{value}' as #{field_type}"
	"@{field} = #{val}"
  end
end
