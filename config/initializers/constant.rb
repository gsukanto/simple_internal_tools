# Curl
JSON_POST_HEADERS = {
  'Content-Type' => 'application/json', 
  'Accept' => 'application/json'
}

# Authorization
UNAUTHORIZED = 'Unauthorized'

# SMS Settings
MAX_MESSAGE_LENGTH = 161
MIN_MESSAGE_LENGTH = 1

# SMS ERROR
EMPTY_CSV_ERROR = 'CSV cannot be empty'
FILE_CSV_ERROR = 'Cannot read CSV file'
MAX_MESSAGE_ERROR = "Message more than #{MAX_MESSAGE_LENGTH} characters"
MIN_MESSAGE_ERROR = 'Message cannot be empty'

# SMS config
SMS_CATEGORY_ID = ENV['SMS_CATEGORY_ID']
SMS_GW_URL = ENV['SMS_GW_URL']