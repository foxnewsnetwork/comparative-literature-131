# == Schema Information
#
# Table name: mangas
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  title      :string(255)
#  summary    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Manga do
  pending "add some examples to (or delete) #{__FILE__}"
end
