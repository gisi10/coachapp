require 'spec_helper'

describe "Static pages" do

	describe "Home page" do

		it "should have the content 'Home'" do
			visit '/static_pages/home'
			page.should have_selector('h1', :text => 'Home')
		end

		it "should have the right title" do
		  visit '/static_pages/home'
		  page.should have_selector('title', :text => "Coachapp | Home")
		end
	end

	describe "help page" do

		it "should have the content 'Hilfe" do
			visit '/static_pages/help'
			page.should have_selector('h1', :text => 'Hilfe')
		end
		it "should have the right title" do
		  visit '/static_pages/help'
		  page.should have_selector('title', :text => "Coachapp | Hilfe")
		end
	end

	describe "About page" do

		it "should have the content 'Impressum'" do
			visit '/static_pages/about'
			page.should have_selector('h1', :text => 'Impressum')
		end

		it "should have the right title" do
		  visit '/static_pages/about'
		  page.should have_selector('title', :text => "Coachapp | Impressum")
		end
	end
end