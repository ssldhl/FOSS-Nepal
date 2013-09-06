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

class Location < ActiveRecord::Base
  attr_accessible :gmaps_zoom, :latitude, :longitude
  belongs_to :meeting
  validates :meeting_id, presence: true

  acts_as_gmappable :check_process => false, validation: false
  def gmaps4rails_address
    "#{longitude}" "#{latitude}"
  end
end
