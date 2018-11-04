class Bike

	attr_reader :broken

	def working?
		@broken ? false : true
	end

	def report_broken
		@broken = true
	end

	def report_working
		@broken = false
	end
end