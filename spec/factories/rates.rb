# == Schema Information
#
# Table name: rates
#
#  id         :integer          not null, primary key
#  value      :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :rate do
    value 50
  end
end
