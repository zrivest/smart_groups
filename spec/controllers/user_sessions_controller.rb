require 'spec_helper'

describe CoursesController do
  context '#login' do
    it "should login a user" do
      user_login_to_page(user)
      page.should have_text("Curent Courses")
    end
  end
end