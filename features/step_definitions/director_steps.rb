Then /^the director of "(.*)" should be "(.*)"$/ do |title, director|
	seen = Movie.find_by_title(title).director
	assert seen == director, 
	"Director of #{title} should be #{director} but seen #{seen}"
end