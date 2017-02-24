require 'rails_helper'

RSpec.describe RateService do
  describe 'check_rate method' do
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

      it 'returns the usual rate' do
        expect(subject).to eq usual_rate
      end
    end

    context 'when we have the valid forced rate' do
      before { valid_forced_rate }

      context 'and the usual rate' do
        before { usual_rate }

        it 'returns the forced rate' do
          expect(subject).to eq valid_forced_rate
        end
      end

      context 'and no usual rate' do
        it 'returns the forced rate' do
          expect(subject).to eq valid_forced_rate
        end
      end
    end

    context 'when we have the expired forced rate' do
      before { expired_forced_rate.save(validate: false) }

      context 'and the usual rate' do
        before { usual_rate }

        it 'returns the usual rate' do
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

  describe 'update_rate method' do
    let!(:rate) { create :rate, value: 50 }

    subject { described_class.new.update_rate }

    context 'when API is available' do
      it 'updates rate from API', vcr: true do
        subject
        expect(Rate.first.value).to eq 58.5005
      end
    end

    context 'when API is not available', vcr: true do
      it 'does not raise error' do
        expect { subject }.not_to raise_error
      end

      it 'does not update rate from API' do
        subject
        expect(Rate.first.value).to eq 50
      end
    end
  end
end
