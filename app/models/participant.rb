# == Schema Information
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  contact    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  meeting_id :integer
#

class Participant < ActiveRecord::Base
  attr_accessible :contact, :name
  belongs_to :meeting
  validates :meeting_id, presence: true
  validates :name, presence: true
end
