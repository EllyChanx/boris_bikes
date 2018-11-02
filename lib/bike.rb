class Bike

	attr_reader :broken

	def working?
		if @broken
			@working = false
		else
			@working = true
		end
	end

	def report_broken
		@broken = true
	end


end