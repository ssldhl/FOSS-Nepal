# == Schema Information
#
# Table name: elocations
#
#  id         :integer          not null, primary key
#  latitude   :float            default(27.693852455795415)
#  longitude  :float            default(85.31417280435562)
#  gmaps_zoom :integer          default(19)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#

require 'spec_helper'

describe Elocation do
  pending "add some examples to (or delete) #{__FILE__}"
end
