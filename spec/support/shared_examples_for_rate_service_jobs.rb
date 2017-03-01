RSpec.shared_examples 'rate_service job' do |method|
  it 'queues the job' do
    expect { subject }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in the default queue' do
    expect(described_class.new.queue_name).to eq('default')
  end

  it 'calls proper service', vcr: true do
    expect_any_instance_of(RateService).to receive(method)
    perform_enqueued_jobs { subject }
  end
end
