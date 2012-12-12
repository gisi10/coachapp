require 'spec_helper'

describe "Static pages" do

	let(:base_title){"Coachapp"}
	subject {page}

	describe "Home page" do
		before { visit root_path}

		it {should have_selector('h1', text: 'Coachapp')}
		it {should have_selector('title', text: full_title(''))}	
		it { should_not have_selector 'title', text: '| Home' }	  
	
	end

	describe "help page" do
		before { visit help_path}

		it {should have_selector('h1', text: 'Hilfe')}
		it {should have_selector('title', text: full_title(''))}	
		it { should_not have_selector 'title', text: '| Hilfe' }	 
	end

	describe "About page" do
		before {visit about_path}

		it {should have_selector('h1', text: 'Impressum')}
		it {should have_selector('title', text: full_title(''))}	
		it { should_not have_selector 'title', text: '| Impressum' }	 
	end

	describe "Contact page" do
		before {visit contact_path}

		it {should have_selector('h1', text: 'Kontakt')}
		it {should have_selector('title', text: full_title(''))}	
		it { should_not have_selector 'title', text: '| Kontakt' }	 
	end
end