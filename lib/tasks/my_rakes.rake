desc "Import activities"
task :import_activities => :environment do #to call use rake import_activities, after bundle exec db:migrate
	File.open("lib/assets/activities.csv", "r").each do |line|
		act_name, act_cals = line.strip.split(";")
		a = Activity.new(:name => act_name, :calsperlb => act_cals)
		a.save
	end
end