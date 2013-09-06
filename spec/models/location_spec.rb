# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  latitude   :float            default(85.3333)
#  longitude  :float            default(27.7)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  meeting_id :integer
#  gmaps_zoom :integer          default(0)
#

require 'spec_helper'

describe Location do
  pending "add some examples to (or delete) #{__FILE__}"
end
