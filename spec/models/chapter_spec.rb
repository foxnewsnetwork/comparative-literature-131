# == Schema Information
#
# Table name: chapters
#
#  id             :integer(4)      not null, primary key
#  manga_id       :integer(4)
#  title          :string(255)
#  chapter_number :integer(4)
#  chapter_before :integer(4)
#  chapter_after  :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Chapter do
  pending "add some examples to (or delete) #{__FILE__}"
end
