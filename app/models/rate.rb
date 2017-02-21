# == Schema Information
#
# Table name: rates
#
#  id         :integer          not null, primary key
#  value      :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rate < ApplicationRecord
  validates :value, presence: true,
                    numericality: { greater_than: 0, less_than: 1000, allow_blank: true },
                    format: {
                      with: /\A\d+(?:\.\d{0,4})?\z/,
                      message: 'could have only 4 decimals',
                      allow_blank: true
                    }
end
