module ProfilesHelper

	def display_education_level(el)
		if el == 4
			return "Postgraduate"
		elsif el == 3
			return "Graduate"
		elsif el == 2
			return "College"
		elsif el == 0
			return ""
		end


	end

	def number_of_employees(company_size)
		if company_size == 1
			return "1"
		elsif company_size == 2
			return "2 - 10"
		elsif company_size == 3
			return "11 - 50"
		elsif company_size == 4
			return "51 - 200"
		elsif company_size == 5
			return "201 - 500"
		elsif company_size == 6
			return "501 - 1,000"
		elsif company_size == 7
			return "1,001 - 5,000"
		elsif company_size == 8
			return "5,001 - 10,000"
		elsif company_size == 9
			return "10,001+"
		end
	end

	def contract(job_contract)
		if job_contract == 1
			return "full-time"
		elsif job_contract == 2
			return "part-time"
		end
	end
end
