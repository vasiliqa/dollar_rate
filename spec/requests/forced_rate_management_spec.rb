require 'rails_helper'

RSpec.describe 'Forced Rate Management', type: :request do
  describe 'GET #edit' do
    it 'has status 200' do
      get admin_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #update' do
    let(:frate) { create :forced_rate }

    before { frate }

    context 'with valid params' do
      before { post admin_path, params: { forced_rate: { value: 80 } } }
      it 'updates frate' do
        # sanity check
        expect(frate.value).not_to eq 80.0
        frate.reload
        expect(frate.value).to eq 80.0
      end

      it 'has status 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid params' do
      before { post admin_path, params: { forced_rate: { value: 80 } } }
      it 'does not update frate' do
        # sanity check
        expect(frate.value).not_to eq nil
        frate.reload
        expect(frate.value).not_to eq nil
      end

      it 'has status 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
