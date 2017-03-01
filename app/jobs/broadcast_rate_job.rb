class BroadcastRateJob < ApplicationJob
  queue_as :default

  def perform
    RateService.new.broadcast_rate
  end
end
