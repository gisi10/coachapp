require 'spec_helper'

describe "UserPages" do
  	subject {page}

  	describe "signup page"do
  		before {visit signup_path}
      let(:submit) { "Create my account" }

      describe "with invalid information" do
        it "should not create a user" do
          expect {click_button submit}.not_to change(User, :count)
        end  

        describe "after submission" do
            before {click_button submit}

            it {should have_selector('title', text: 'Sign Up')}
            it {should have_content('Fehler')}          
        end
      end

      

      describe "with valid information" do
        before do
          fill_in "Name", with: "Example User"
          fill_in "Email", with: "user@example.com"
          fill_in "Password", with: "foobar"
          fill_in "Confirmation", with: "foobar"
        end   

        describe "after saving the user" do
          before {click_button submit}
          let(:user) { User.find_by_email('user@example.com') }

          it {should have_selector('title', text: user.name)}
          it {should have_selector('div.alert.alert-success', text: 'Willkommen')}
          it {should have_link('Sign out')}
        end     

        it "should create a user" do
          expect{click_button submit}.to change(User, :count).by(1)          
        end
      end

  		it {should have_selector('h1', text: 'Sign Up')}
  		it {should have_selector('title', text: full_title('Sign Up'))}
  	end

  	describe "profile page" do
  		let(:user) { FactoryGirl.create(:user) }
  		#Code to make a user Variable
  		before {visit user_path(user)}

  		it {should have_selector('h1',    text: user.name)}
  		it {should have_selector('title', text: user.name)}
  	end

    describe "edit" do
      let(:user) { FactoryGirl.create(:user) }
      before {visit edit_user_path(user)}

      describe "page" do
        it {should have_selector('h1', text: "Updaten Sie Ihr Profil")}
        it {should have_selector('title', text: "Edit user")}
        it {should have_link('change', href: 'http://gravatar.com/emails')}
      end

      describe "with invalid information" do
        before {click_button "Save changes"}

        it {should have_content('Fehler')}
      end

      describe "with valid information" do
        let(:new_name) { "New Name" }        
        let(:new_email) { "new@example.com" }
        before do
          fill_in "Name", with: new_name
          fill_in "Email", with: new_email
          fill_in "Password", with: user.password
          fill_in "Confirm Password", with: user.password
          click_button "Save Changes"
        end

        it {should have_selector('title', text: new_name)}
        it {should have_selector('div.alert.alert-success')}
        it {should have_link('Sign out', href: signout_path)}
        specify {user.reload.name.should == new_name}
        specify {user.reload.email.should == new_email}
      end
    end
end
