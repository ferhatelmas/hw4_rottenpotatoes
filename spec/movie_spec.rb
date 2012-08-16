describe Movie do
	before do 
		@movie = FactoryGirl.build(:movie, title: 'The Passionate Developer', 
			rating: 'G', director: 'ferhat elmas')
	end

	subject { @movie }

	it { should respond_to(:title) }
	it { should respond_to(:rating) }
	it { should respond_to(:release_date) }
	it { should respond_to(:director) }
	it { should respond_to(:description) }

end