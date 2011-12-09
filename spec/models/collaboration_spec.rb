# == Schema Information
#
# Table name: collaborations
#
#  id              :integer(4)      not null, primary key
#  manga_id        :integer(4)
#  rank            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  collaborator_id :integer(4)
#

require 'spec_helper'

describe Collaboration do
  pending "add some examples to (or delete) #{__FILE__}"
end
