require 'spec_helper'

describe "Static pages" do

	subject {page}

	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_selector('title', text: full_title(page_title)) }
	end


	describe "Home page" do
		before { visit root_path}
		let(:page_title) { '' }
		let(:heading) { "Coachapp" }

		it_should_behave_like "all static pages"
		it { should_not have_selector 'title', text: '| Home' }	  
	
	end

	describe "help page" do
		before { visit help_path}
		let(:page_title) { '' }
		let(:heading) { 'Hilfe' }
		
		it_should_behave_like "all static pages"
		it { should_not have_selector 'title', text: '| Hilfe' }	 
	end

	describe "About page" do
		before {visit about_path}
		let(:page_title) {''}
		let(:heading) {  'Impressum'}
		
		it_should_behave_like "all static pages"
		it { should_not have_selector 'title', text: '| Impressum' }	 
	end

	describe "Contact page" do
		before {visit contact_path}
		let(:page_title) { '' }
		let(:heading) { 'Kontakt' }
		
		it_should_behave_like "all static pages"	
		it { should_not have_selector 'title', text: '| Kontakt' }	 
	end
end