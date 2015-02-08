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

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
