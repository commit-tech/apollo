# == Schema Information
#
# Table name: timeslots
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  mc_only         :boolean          not null
#  day             :integer          not null
#  default_user_id :integer          not null
#  time_range_id   :integer          not null
#  place_id        :integer          not null
#
# Indexes
#
#  index_timeslots_on_default_user_id  (default_user_id)
#  index_timeslots_on_place_id         (place_id)
#  index_timeslots_on_time_range_id    (time_range_id)
#

require 'rails_helper'

RSpec.describe Timeslot, type: :model do
  it 'successfully saves if no column is null' do
    timeslot = build(:timeslot)
    expect(timeslot.save).to be true
  end
  it 'does not save if mc_only is null' do
    timeslot = build(:timeslot, mc_only: nil)
    expect(timeslot.save).to be false
  end
  it 'does not save if day is null' do
    timeslot = build(:timeslot, day: nil)
    expect(timeslot.save).to be false
  end
end
