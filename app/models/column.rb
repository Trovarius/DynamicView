# == Schema Information
#
# Table name: columns
#
#  id           :integer          not null, primary key
#  page_id      :integer
#  title        :string
#  hint         :string
#  column_type  :integer
#  required     :boolean
#  show_list    :boolean
#  show_edit    :boolean
#  show_new     :boolean
#  show_detail  :boolean
#  command_type :integer
#  command      :text
#  created_at   :datetime
#  updated_at   :datetime
#  order        :integer
#  is_key       :boolean
#  field        :string
#  field_type   :string           not null
#

class Column < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :page
  
  #scope columns
  #default_scope {order('columns.order asc')}
  scope  :new_columns, -> {where('show_new = ?', 1 )}
  scope  :list_columns, -> {where('show_list = ? ', 1 )}
  scope  :search_columns, -> {where('show_search = ? ', 1  )}
  scope  :edit_columns, -> {where('show_detail = ? ', 1 )}
  scope  :is_key, ->{where('is_key = ?', 1)}
  
  def sql_variable(value = nil)
	val = value.nil? ? "null" :"cast('#{value}' as #{field_type})"
	"@#{field} = #{val}"
  end
  
end
