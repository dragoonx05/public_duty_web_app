class TwilioTextMessenger
    attr_reader :message

    def initialize(message)
        @message = message
    end

    def messages
        @client = Twilio::REST::Client.new

        @client.messages.create){
            from: ENV['twilio_phone_number'],
            to: ENV['my_number'],
            body: 'You have made a duty booking!'
        })
    end

end