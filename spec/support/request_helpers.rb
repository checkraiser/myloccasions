module RequestHelpers
  module Helpers
    def click_sign_in
      visit "/"
      click_link "Sign In"
    end
    def login_user(user)
      visit new_user_session_path
      fill_in "Email", :with => "testy@test.com"
      fill_in "Password", :with => "password"
      click_button "Sign in"
    end
  end
end
