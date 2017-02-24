class RateService
  def check_rate
    frate = ForcedRate.first

    frate_is_valid = frate.present? && frate.expiry_time > Time.zone.now

    frate_is_valid ? frate : Rate.first
  end

  def update_rate
    Rate.first_or_initialize.update(value: get_rate_from_api)
  end

  private

  def get_rate_from_api
    uri = URI('http://apilayer.net/api/live')
    params = { access_key: ENV['CURRENCY_LAYER_KEY'], currencies: 'RUB' }
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get_response(uri)

    raise RateAPIError, 'Request to Rate API is not successful' if response.code != '200'

    data = ActiveSupport::JSON.decode(response.body)
    data['quotes']['USDRUB'].round(4)

  rescue RateAPIError, RateAPIError => e
  end
end

class RateAPIError < StandardError; end
