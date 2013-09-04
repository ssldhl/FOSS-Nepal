# == Schema Information
#
# Table name: outcomes
#
#  id         :integer          not null, primary key
#  result     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Outcome < ActiveRecord::Base
  attr_accessible :result
  belongs_to :meeting
end
