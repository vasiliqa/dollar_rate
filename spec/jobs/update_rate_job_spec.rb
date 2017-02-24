require 'rails_helper'

RSpec.describe UpdateRateJob, type: :job do
  include ActiveJob::TestHelper

  subject { described_class.perform_later }

  it 'queues the job' do
    expect { subject }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in the default queue' do
    expect(described_class.new.queue_name).to eq('default')
  end

  it 'calls proper service', vcr: true do
    expect_any_instance_of(RateService).to receive(:update_rate)
    perform_enqueued_jobs { subject }
  end
end
