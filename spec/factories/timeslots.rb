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

FactoryGirl.define do
  factory :timeslot do
    mc_only { generate(:bool) }
    day { generate(:days) }
    association :default_user, factory: :user
    time_range
    place
  end
end
