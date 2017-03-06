class SmsWorker
  include Sidekiq::Worker

  sidekiq_options retry: ENV['SMS_RETRY'].to_i
  sidekiq_retry_in { 60 }

  def perform(phone, message, category_id, sms_gw_url)
    response = send_sms(message, validate_phone(phone), category_id, sms_gw_url)
    log_sms(response, phone, message)
  end

  private
  # Validation
  def validate_phone(phone)
    return phone
                        .gsub(/^0/, "+62")
                        .gsub(/^8/, "+628")
                        .gsub(/^62/, "+62")
  end

  def send_sms(message, phone, category_id, sms_gw_url)
    return post_json(sms_gw_url, make_payload(message, phone, category_id))
  end

  def make_payload(message, phone, category_id)
    return {
        "to": phone,
        "category_id": category_id,
        "message": message
      }.to_json
  end

  def log_sms(response, phone, message)
    status = get_status(response.try(:ResponseCode))

    SmsStatus.create(
      phone: phone,
      message: message,
      status: status
    )
  end

  def get_status(is_success)
    return false unless is_success
    return is_success.to_i == 0
  end

  def post_json(url, payload)
    curl = Curl::Easy.new(url)
    curl.timeout = ENV['CURL_TIMEOUT'].to_i
    curl.ssl_verify_peer = false
    curl.headers = JSON_POST_HEADERS

    curl.http_post(payload)

    return JSON(curl.body) || nil
  end
end
