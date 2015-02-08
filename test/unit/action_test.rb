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

require 'test_helper'

class ActionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
