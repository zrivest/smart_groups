require 'spec_helper'

describe User do
  context '#initialize' do
    let(:user) { FactoryGirl.create(:user)}

    it 'should be valid if email and password is valid' do
      user = FactoryGirl.build(:user)
      user.save!
      expect(user).to be_valid
    end
  end

  context '#associations' do
    let(:user) { FactoryGirl.create(:user)}
    let(:course) { FactoryGirl.create(:course)}

    it 'should have many courses' do
      user.courses << course << course

      expect(user.courses.length).to be(2)
    end
  end
end