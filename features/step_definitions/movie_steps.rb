Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
  end
  seen = Movie.count
  expected = movies_table.hashes.length
  assert seen == expected, "Number of movies should be #{expected} but seen #{seen}"
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  i1 = page.body.index(e1)
  i2 = page.body.index(e2)
  assert i1 < i2, "Expected to see #{e1} before #{e2}"
  # page.body =~ /#{e1}.*#{e2}/m 
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(", ").each do |rating|
    if uncheck
      uncheck("ratings_" + rating)
    else
      check("ratings_" + rating)
    end
  end
end

Then /I should see all of the movies/ do 
  seen = page.all("table#movies tbody tr").count
  expected = Movie.count
  assert seen == expected, "Number of movies should be #{expected} but seen #{seen}"
end

Then /I should see none of the movies/ do
  seen = page.all("table#movies tbody tr").count
  expected = 0
  assert seen == expected, "Number of movies should be #{expected} but seen #{seen}"
end