require 'spec_helper'

describe MoviesController do

	subject { MoviesController }

	before do
		@a = mock('Movie')
		@a.stub(:director).and_return('wellknown-director')

		@b = mock('Movie')
		@b.stub(:director).and_return('wellknown-director')

		@c = mock('Movie')
		@c.stub(:director).and_return('unknown-director')
		
		@d = mock('Movie')
		@d.stub(:title).and_return('I have no director info')
		@d.stub(:director).and_return('')
	end

	describe 'search with same director' do
		def find_director
			get :find_with_same_director, { id: 1 }
		end

		describe 'in happy path' do
			before do
				Movie.stub(:find).with("1").and_return(@a)
			end

			it 'should call model method to find movie' do
				find_director
				assigns(:movie) == @a
			end

			it 'should call model method to find similar movies' do
				Movie.should_receive(:find_all_by_director).with(@a.director)
				find_director
			end

			it 'should find similar movies if exists' do
				fake_movies = [@a, @b]
				Movie.stub(:find_all_by_director).with(@a.director)
					.and_return(fake_movies) 
				find_director
				assigns(:movies) == fake_movies
			end 

			it 'should render happy path view' do
				find_director 
				response.should render_template('find_with_same_director')
			end
		end

		describe 'in sad path' do

			before do
				Movie.stub(:find).with("1").and_return(@d)
			end

			it 'should call model method to find movie' do
				find_director
				assigns(:movie) == @d
			end

			it 'should not call model method to find similar movies' do
				Movie.should_not_receive(:find_all_by_director)
				find_director
			end

			it 'should not find any movies' do 
				find_director
				page.has_content?("'#{@d.title}' has no director info")
			end

			it 'should render sad path view' do
				find_director 
				response.should_not render_template('find_with_same_director')
			end


		end

	end

end