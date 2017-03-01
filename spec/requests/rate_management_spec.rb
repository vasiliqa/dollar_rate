require 'rails_helper'

RSpec.describe 'Rate Management', type: :request do
  describe 'GET #show' do
    let(:rate) { create :rate }

    it 'has status 200' do
      rate
      get root_path
      expect(response).to have_http_status(200)
    end

    it 'calls proper service' do
      expect_any_instance_of(RateService).to receive(:check_rate)
      get root_path
    end
  end
end
