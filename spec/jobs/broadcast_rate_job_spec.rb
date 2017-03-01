require 'rails_helper'
require 'support/shared_examples_for_rate_service_jobs'

RSpec.describe BroadcastRateJob, type: :job do
  include ActiveJob::TestHelper

  subject { described_class.perform_later }

  it_behaves_like 'rate_service job', :broadcast_rate
end
