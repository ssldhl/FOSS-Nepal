# == Schema Information
#
# Table name: econtacts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  contact    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#

require 'spec_helper'

describe Econtact do
  pending "add some examples to (or delete) #{__FILE__}"
end
