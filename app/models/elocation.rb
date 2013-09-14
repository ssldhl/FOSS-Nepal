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

class Elocation < ActiveRecord::Base
  attr_accessible :gmaps_zoom, :latitude, :longitude
  belongs_to :event
  validates :event_id, presence: true
  acts_as_gmappable :check_process => false, validation: false
  def gmaps4rails_address
    "#{longitude}" "#{latitude}"
  end
end
