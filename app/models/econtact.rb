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

class Econtact < ActiveRecord::Base
  attr_accessible :contact, :name
  belongs_to :event
  validates :event_id, presence: true
	validates_presence_of :name, :contact  
end
