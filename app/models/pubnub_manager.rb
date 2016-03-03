module PubnubManager

  def self.publish channel, object
    PUBNUB_CLIENT.publish(
      channel: channel,
      message: object
    ) do |envelope|
      Rails.logger.info "#{channel}"
      Rails.logger.info envelope.parsed_response
    end
  end

end