FactoryGirl.define do
	factory :movie do
		title 'A Title'
		rating 'PG'
		release_date { 5.years.ago }
		director nil
	end
end