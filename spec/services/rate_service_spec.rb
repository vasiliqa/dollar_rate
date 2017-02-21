require 'rails_helper'

RSpec.describe RateService do
  let(:usual_rate) { create :rate }
  let(:valid_forced_rate) { create :forced_rate }
  let(:expired_forced_rate) { build :forced_rate, expiry_time: Time.zone.now - 1.day }

  subject { described_class.new.check_rate }

  context 'when we have no rates at all' do
    it 'returns nil' do
      expect(subject).to eq nil
    end
  end

  context 'when we have no forced rate' do
    before { usual_rate }

    it 'returns usual rate' do
      expect(subject).to eq usual_rate
    end
  end

  context 'when we have valid forced rate' do
    before { valid_forced_rate }

    context 'and usual rate' do
      before { usual_rate }

      it 'returns forced rate' do
        expect(subject).to eq valid_forced_rate
      end
    end

    context 'and no usual rate' do
      it 'returns forced rate' do
        expect(subject).to eq valid_forced_rate
      end
    end
  end

  context 'when we have expired forced rate' do
    before { expired_forced_rate.save(validate: false) }

    context 'and usual rate' do
      before { usual_rate }

      it 'returns usual rate' do
        expect(subject).to eq usual_rate
      end
    end

    context 'and no usual rate' do
      it 'returns nil' do
        expect(subject).to eq nil
      end
    end
  end

end
