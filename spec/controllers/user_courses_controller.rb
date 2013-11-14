require 'spec_helper'

describe UserCoursesController do
  context '#update page' do
    let(:course) { FactoryGirl.create(:course) }
    let(:user) { FactoryGirl.create(:user) }

    it "finds the correct course in @course" do
      pending
    end
  end
end