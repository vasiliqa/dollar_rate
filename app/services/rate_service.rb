class RateService
  def check_rate
    frate = ForcedRate.first

    frate_is_valid = frate.present? && frate.expiry_time > Time.zone.now

    frate_is_valid ? frate : Rate.first
  end
end
