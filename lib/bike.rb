class Bike

	def working?
		true unless @broken = true
		false
	end

	def report_broken
		@broken = true
	end

	def broken?
		@broken
	end

end