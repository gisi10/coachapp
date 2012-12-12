require 'spec_helper'

describe "Static pages" do

	let(:base_title){"Coachapp"}

	describe "Home page" do

		it "should have the content 'Willkommen bei der Coachapp'" do
			visit root_path
			page.should have_selector('h1', :text => 'Wilkommen bei der Coachapp')
		end

		it "should have the base title" do
		  visit root_path
		  page.should have_selector('title', :text => "Coachapp")
		end

		it "should not have a custom page title" do
			visit root_path
			page.should_not have_selector('title', :text => '| Home')		  
		end
	end

	describe "help page" do

		it "should have the content 'Hilfe" do
			visit help_path
			page.should have_selector('h1', :text => 'Hilfe')
		end

		it "should have the base title" do
		  visit help_path
		  page.should have_selector('title', :text => "Coachapp")
		end

		it "should not have a custom page title" do
			visit help_path
			page.should_not have_selector('title', :text => '| Home')		  
		end
	end

	describe "About page" do

		it "should have the content 'Impressum'" do
			visit about_path
			page.should have_selector('h1', :text => 'Impressum')
		end

		it "should have the base title" do
		  visit about_path
		  page.should have_selector('title', :text => "Coachapp")
		end

		it "should not have a custom page title" do
			visit about_path
			page.should_not have_selector('title', :text => '| Home')		  
		end
	end

	describe "Contact page" do

		it "should have the content 'Kontakt'" do
			visit contact_path
			page.should have_selector('h1', :text => 'Kontakt')
		end

		it "should have the base title" do
		  visit contact_path
		  page.should have_selector('title', :text => "Coachapp")
		end

		it "should not have a custom page title" do
			visit contact_path
			page.should_not have_selector('title', :text => '| Home')		  
		end
	end
end