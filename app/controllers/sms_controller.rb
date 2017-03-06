class SmsController < ApplicationController
    before_action :trim_message, only: [:import]

    def index
    end

    def import
        require 'csv'

        return fail_redirect(UNAUTHORIZED)  unless is_authorized

        error_message = validate(params[:file], params[:message])
        return fail_redirect(error_message) if error_message

        begin 
            CSV.foreach(params[:file].path, :headers => true) do |row|
                SmsWorker.perform_async(row['phone'], params['message'], SMS_CATEGORY_ID, SMS_GW_URL)
            end
        rescue
            return fail_redirect(FILE_CSV_ERROR)
        end

        success_redirect("sending sms for #{params[:file].original_filename} with message #{params[:message]} ")
    end

    def template
      require 'csv'

      respond_to do |format|
        format.csv do
          headers['Content-Disposition'] = "attachment; filename=\"phone_template.csv\""
          headers['Content-Type'] ||= 'text/csv'
        end
      end
    end

    private
    def trim_message
        params[:message] = params[:message].strip
    end

    def validate(file, message)
        file_not_valid = validate_file(file)
        message_not_valid = validate_message(message)
        return "#{file_not_valid}\n#{message_not_valid}" if file_not_valid || message_not_valid
    end

    def validate_file(file)
        return EMPTY_CSV_ERROR if file.blank?
    end

    def validate_message(message)
        return MAX_MESSAGE_ERROR if message.length >= MAX_MESSAGE_LENGTH
        return MIN_MESSAGE_ERROR if message.length < MIN_MESSAGE_LENGTH
    end

    def fail_redirect(alert)
        redirect_to :sms, alert: alert 
    end

    def success_redirect(notice)
        redirect_to :sms, notice: notice 
    end

    def is_authorized
        return current_user.has_role? :sms
    end
end
