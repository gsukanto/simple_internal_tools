class SmsWorker
  include Sidekiq::Worker

  sidekiq_options retry: 2
  sidekiq_retry_in { 60 }

  def perform(phone_number, message)
    send_sms(validate_phone_number(phone_number), message)
  end

  private
  # Validation
  def validate_phone_number(phone)
    return phone
                        .gsub(/^0/, "+62")
                        .gsub(/^8/, "+628")
                        .gsub(/^62/, "+62")
  end

  def send_sms(phone_number, message)
    uri           = URI.parse("https://rest.nexmo.com/sms/json")
    params        = {
                      'api_key'        => ENV["NEXMO_API_KEY"],
                      'api_secret'   => ENV["NEXMO_API_SECRET"],
                      'to'                   => phone_number,
                      'from'              => ENV['NEXMO_FROM'],
                      'text'                => message
                  }

    return Net::HTTP.post_form(uri, params)
  end

end
