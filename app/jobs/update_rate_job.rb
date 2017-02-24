class UpdateRateJob < ApplicationJob
  queue_as :default

  rescue_from(Timeout::Error, SocketError) do
    retry_job wait: 5.minutes, queue: :default
  end

  def perform
    RateService.new.update_rate
  end
end
