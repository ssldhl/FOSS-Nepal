# == Schema Information
#
# Table name: eventlists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  info       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#

class Eventlist < ActiveRecord::Base
  attr_accessible :info, :name
  belongs_to :event
  validates :event_id, presence: true
  validates_presence_of :name, :info
end
