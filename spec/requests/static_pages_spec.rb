require 'spec_helper'

describe "Static pages" do

	let(:base_title){"Coachapp"}

	describe "Home page" do

		it "should have the content 'Home'" do
			visit '/static_pages/home'
			page.should have_selector('h1', :text => 'Home')
		end

		it "should have the right title" do
		  visit '/static_pages/home'
		  page.should have_selector('title', :text => "#{base_title} | Home")
		end
	end

	describe "help page" do

		it "should have the content 'Hilfe" do
			visit '/static_pages/help'
			page.should have_selector('h1', :text => 'Hilfe')
		end
		it "should have the right title" do
		  visit '/static_pages/help'
		  page.should have_selector('title', :text => "#{base_title} | Hilfe")
		end
	end

	describe "About page" do

		it "should have the content 'Impressum'" do
			visit '/static_pages/about'
			page.should have_selector('h1', :text => 'Impressum')
		end

		it "should have the right title" do
		  visit '/static_pages/about'
		  page.should have_selector('title', :text => "#{base_title} | Impressum")
		end
	end

	describe "Contact page" do

		it "should have the content 'Kontakt'" do
			visit '/static_pages/contact'
			page.should have_selector('h1', :text => 'Kontakt')
		end

		it "should have the right title" do
			visit '/static_pages/contact'
		    page.should have_selector('title', :text => "#{base_title} | Kontakt")
		end
	end
end