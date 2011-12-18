# == Schema Information
#
# Table name: obsessions
#
#  id         :integer(4)      not null, primary key
#  stalker_id :integer(4)
#  stalked_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Obsession do
  pending "add some examples to (or delete) #{__FILE__}"
end
