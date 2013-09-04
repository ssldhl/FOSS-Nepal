# == Schema Information
#
# Table name: meetings
#
#  id           :integer          not null, primary key
#  meeting_date :date
#  name         :string(255)
#  info         :string(255)
#  venue        :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Meeting < ActiveRecord::Base
  attr_accessible :info, :meeting_date, :name, :venue
  has_many :participants, :dependent => :destroy
  has_one :outcome, :dependent => :destroy
  validates_presence_of :name, :info, :meeting_date, :venue
end
