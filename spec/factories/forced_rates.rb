# == Schema Information
#
# Table name: forced_rates
#
#  id          :integer          not null, primary key
#  value       :float            not null
#  expiry_time :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :forced_rate do
    value 60
    expiry_time Time.zone.now + 1.day
  end
end
