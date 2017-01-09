class PubnubInteractor
	def self.call(channel, object)
	 interactor = new(channel, object)
	 interactor.run
	 interactor
	end

	attr_reader :error

	def initialize(channel, object)
	 @channel, @object = channel, object
	end

	def success?
	 @error.nil?
	end

	def run
	 PubnubService.publish(@channel, @object)
	rescue Exception => exception
	 fail!(exception.message)
	end

	private

	attr_reader :context

	def fail!(error)
	 @error = error
	end
end