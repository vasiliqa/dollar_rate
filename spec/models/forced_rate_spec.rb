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

require 'rails_helper'

RSpec.describe ForcedRate, type: :model do
  describe 'validations' do
    it { should validate_presence_of :value }
    it { should validate_presence_of :expiry_time }
    it { should validate_numericality_of(:value).is_greater_than(0).is_less_than(1000) }
    it { should allow_values(5, 0.3, 8.4598).for(:value) }
    it { should_not allow_value(9.83604).for(:value) }
    it { should allow_value(Time.zone.now + 1.day).for(:expiry_time) }
    it { should_not allow_value(Time.zone.now - 1.day).for(:expiry_time) }
  end
end
