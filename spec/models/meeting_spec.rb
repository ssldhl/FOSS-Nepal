# == Schema Information
#
# Table name: meetings
#
#  id           :integer          not null, primary key
#  meeting_date :date
#  name         :string(255)
#  info         :string(255)
#  venue        :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Meeting do
  pending "add some examples to (or delete) #{__FILE__}"
end
