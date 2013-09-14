# == Schema Information
#
# Table name: results
#
#  id          :integer          not null, primary key
#  description :text
#  extras      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  event_id    :integer
#

class Result < ActiveRecord::Base
  attr_accessible :description, :extras
  belongs_to :event
  validates :event_id, presence: true
  validates_presence_of :description
end
