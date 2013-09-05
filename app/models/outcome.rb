# == Schema Information
#
# Table name: outcomes
#
#  id         :integer          not null, primary key
#  result     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  meeting_id :integer
#

class Outcome < ActiveRecord::Base
  attr_accessible :result
  belongs_to :meeting
  validates :meeting_id, presence: true
  validates :result, presence: true
end
