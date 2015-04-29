#require 'awesome_print'
module CalculatorHelper
	KGLBS = 2.20462
	CARBCAL = 4
	PROTEINCAL = 4
	FATCAL = 9

	def self.bmr_cals(weight, bodyfat)
		#using the Katch-McArdle Formula
		lean_body_mass_kg = (weight/KGLBS) * (1 - bodyfat/100.0)
		return 21.6 * lean_body_mass_kg + 370
	end

	def self.total_cals(weight, bodyfat, activitycals=400)
		bmr_cals(weight, bodyfat)+activitycals
	end

	def	self.daily_req(daily_cals, carb_percent=10, fat_percent=70, protein_percent=20)
		table = {}
		
		table[:macronutrient] = ["Carbs", "Fat", "Protein"]
		table[:keto_ratios] = [carb_percent, fat_percent, protein_percent]
		table[:keto_cals] = table[:keto_ratios].map{ |percent| percent/100.0 * daily_cals} 
		table[:caloriespergram] = [CARBCAL, FATCAL, PROTEINCAL]
		table[:grams] = [ table[:keto_cals][0]/table[:caloriespergram][0] , 
							 	table[:keto_cals][1]/table[:caloriespergram][1] , 
								table[:keto_cals][2]/table[:caloriespergram][2]] 
		table
	end

	def self.daily_req_i(daily_cals, carb_percent=10, fat_percent=70, protein_percent=20)
		table = {}
		table[:labels] = ["Macronutrient", "Target Ratios", "Target Calories", "Calories per Gram", "Grams"]
		table[:carbs] = ["Carbs", carb_percent, carb_percent/100.0 * daily_cals, CARBCAL ]
		table[:carbs].push(table[:carbs][2]/table[:carbs][3])
		table[:fat] = ["Fat", fat_percent, fat_percent/100.0 * daily_cals, FATCAL ]
		table[:fat].push(table[:fat][2]/table[:fat][3])
		table[:protein] = ["Protein", protein_percent, protein_percent/100.0 * daily_cals, PROTEINCAL ]
		table[:protein].push(table[:protein][2]/table[:protein][3])
		table
	end
end

=begin
Macronutrient, Target Ratios, Target Calories, Calories per Gram, Grams
carbs, 0, 10, 84, 4, 21
fat, 70, 589, 9, 65
protein, 20,108,4,42
=end
=begin
totalcals = CalculatorHelper.total_cals(181, 21)
ap totalcals
ap CalculatorHelper.daily_req_i(totalcals)
#ap CalculatorHelper.daily_req(totalcals, 4, 70, 26)
=end