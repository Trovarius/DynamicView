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

require 'test_helper'

class ColumnTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
