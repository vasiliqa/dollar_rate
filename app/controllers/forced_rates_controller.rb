class ForcedRatesController < ApplicationController
  def edit
    @forced_rate = ForcedRate.first_or_initialize
  end

  def update
    @forced_rate = ForcedRate.first_or_initialize
    flash.now[:success] = 'Forced rate succesfuly saved!' if @forced_rate.update(forced_rate_params)
    render :edit
  end

  private

  def forced_rate_params
    params.require(:forced_rate).permit(:value, :expiry_time)
  end
end
