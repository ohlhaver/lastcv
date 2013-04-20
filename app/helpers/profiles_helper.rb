module ProfilesHelper

	def display_education_level(el)
		if el == 4
			return "Postgraduate"
		elsif el == 3
			return "Graduate"
		elsif el == 2
			return "College"
		elsif el == 1
			return "Highschool"
		elsif el == 0
			return ""
		end


	end
end
