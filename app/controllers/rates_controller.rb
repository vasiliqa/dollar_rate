class RatesController < ApplicationController
  def show
    @rate = RateService.new.check_rate
  end
end
