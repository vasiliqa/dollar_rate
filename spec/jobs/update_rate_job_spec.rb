require 'rails_helper'
require 'support/shared_examples_for_rate_service_jobs'

RSpec.describe UpdateRateJob, type: :job do
  include ActiveJob::TestHelper

  subject { described_class.perform_later }

  it_behaves_like 'rate_service job', :update_rate

  it 'handles timeout error' do
    allow_any_instance_of(RateService).to receive(:update_rate).and_raise(Timeout::Error)

    perform_enqueued_jobs do
      expect_any_instance_of(UpdateRateJob).
        to receive(:retry_job).with(wait: 5.minutes, queue: :default)
      subject
    end
  end

  it 'handles socket error' do
    allow_any_instance_of(RateService).to receive(:update_rate).and_raise(SocketError)

    perform_enqueued_jobs do
      expect_any_instance_of(UpdateRateJob).
        to receive(:retry_job).with(wait: 5.minutes, queue: :default)
      subject
    end
  end
end
