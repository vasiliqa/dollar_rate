require 'rails_helper'

RSpec.describe 'Rate Management', type: :request do
  describe 'GET #show' do
    let(:rate) { create :rate }

    it 'has status 200' do
      rate
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
