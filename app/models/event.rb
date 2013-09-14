# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  info       :string(255)
#  event_time :datetime
#  venue      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :event_time, :info, :name, :venue
  has_many :econtacts, :dependent => :destroy
  has_one :elocation, :dependent => :destroy
  has_many :eventlists, :dependent => :destroy
  has_one :result, :dependent => :destroy
  validates_presence_of :name, :event_time, :info, :venue
  default_scope order: 'events.created_at DESC'
end
