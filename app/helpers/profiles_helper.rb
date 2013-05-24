module ProfilesHelper

	def display_education_level(el)
		if el == 4
			return "Postgraduate"
		elsif el == 3
			return "Graduate"
		elsif el == 2
			return "Undergraduate"
		elsif el == 1
			return "Highschool"	
		elsif el == 0 
			return "-"
		end


	end

	def test_score_name(type_id)
		if type_id == 1
			return "SAT math"
		elsif type_id == 2
			return "SAT critical reading"
		elsif type_id == 3
			return "SAT writing"
		elsif type_id == 4
			return "ACT English"
		elsif type_id == 5
			return "ACT math"
		elsif type_id == 6
			return "ACT reading"
		elsif type_id == 7
			return "ACT science"
		else
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

	def status(profile)
		invitation = find_invitation(profile)
		if invitation
			if invitation.approval
				"request approved"
				
			else
				"request submitted"
			end
		else
			"-"
		end
	end

	def willingness(fulltime, parttime)
		if fulltime == true
			if parttime == true
				return "full-time & part-time"
			else
				return "only full-time"
			end
		else
			if parttime == true
				return "only part-time"
			else
				return "no"
			end

		end
	end

	def short_willingness(fulltime, parttime)
		if fulltime == true
			if parttime == true
				return "full-time, part-time"
			else
				return "full-time"
			end
		else
			if parttime == true
				return "part-time"
			else
				return "no"
			end

		end
	end

	def app_years(ios, android)

		android = 0 if android == nil
		ios = 0 if ios == nil
		greater = [ios,android].max
		if greater > 0
			return greater.to_s + " years"
		else
			return nil
		end

	end

	def apps_sum(ios,android)
		android = 0 if android == nil
		ios = 0 if ios == nil
		sum = ios + android
		if sum > 0
			return sum.to_s
		else
			return nil
		end
	end
end
