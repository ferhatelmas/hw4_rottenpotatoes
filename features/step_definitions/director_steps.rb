Then /^the director of "(.*)" should be "(.*)"$/ do |title, director|
	seen = Movie.find_by_title(title).director
	assert seen == director, 
	"Director of #{title} should be #{director} but seen #{seen}"
end

Given /^the following movies exist:$/ do |table|
	table.hashes.each { |movie| Movie.create!(movie) }
	expected = table.hashes.length
	seen = Movie.count
	assert seen == expected, 
	"There should be #{expected} movies but seen #{seen}"
end

