class ForcedRatesController < ApplicationController
  def edit
    @forced_rate = ForcedRate.first_or_initialize
  end

  def update
    @forced_rate = ForcedRate.first_or_initialize
    if @forced_rate.update(forced_rate_params)
      flash.now[:success] = 'Forced rate succesfuly saved!'
      RateService.new.broadcast_rate
      BroadcastRateJob.set(wait_until: ForcedRate.first.expiry_time + 1.second).perform_later
    end
    render :edit
  end

  private

  def forced_rate_params
    params.require(:forced_rate).permit(:value, :expiry_time)
  end
end
