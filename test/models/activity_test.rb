require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

	def setup #preload the data for testing
		File.open("lib/assets/activities.csv", "r").each do |line|
			act_name, act_cals = line.strip.split(";")
			a = Activity.new(:name => act_name, :calsperlb => act_cals)
			a.save
		end
	end

	test "were the activities initialized" do
		ac = Activity.count
  	   assert_equal(158 , ac, "Count of activities incorrect")
  	end

end
