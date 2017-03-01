require 'rails_helper'

RSpec.describe 'Forced Rate Management', type: :request do
  describe 'GET #edit' do
    it 'has status 200' do
      get admin_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #update' do
    include ActiveJob::TestHelper

    let(:frate) { create :forced_rate }

    before { frate }

    context 'with valid params' do
      it 'updates frate' do
        post admin_path, params: { forced_rate: { value: 80 } }
        expect(frate.value).to eq 60.0
        frate.reload
        expect(frate.value).to eq 80.0
      end

      it 'has status 200' do
        post admin_path, params: { forced_rate: { value: 80 } }
        expect(response).to have_http_status(200)
      end

      it 'calls proper service' do
        expect_any_instance_of(RateService).to receive(:broadcast_rate)
        post admin_path, params: { forced_rate: { value: 80 } }
      end

      it 'calls proper job' do
        expect { post admin_path, params: { forced_rate: { value: 80 } } }.
          to have_enqueued_job(BroadcastRateJob)
      end
    end

    context 'with invalid params' do
      before { post admin_path, params: { forced_rate: { value: nil } } }
      it 'does not update frate' do
        expect(frate.value).to eq 60.0
        frate.reload
        expect(frate.value).to eq 60.0
      end

      it 'has status 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
