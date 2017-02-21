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

class ForcedRate < ApplicationRecord
  validates :value, presence: true,
                    numericality: { greater_than: 0, less_than: 1000, allow_blank: true },
                    format: {
                      with: /\A\d+(?:\.\d{0,4})?\z/,
                      message: 'could have only 4 decimals',
                      allow_blank: true
                    }
  validates :expiry_time, presence: true

  validate :valid_expiry_time
  def valid_expiry_time
    errors.add(:expiry_time, 'must be in future') if expiry_time && expiry_time < Time.zone.now
  end
end
