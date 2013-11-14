module UserHelper

  def user_login_to_page(user)
    visit root_path
    first('#email').set user.email
    first('#password').set "password"
    click_button "Login"
  end
end