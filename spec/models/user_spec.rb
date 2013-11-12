require 'spec_helper'

describe User do
  context '#associations' do
    let(:user) { FactoryGirl.create(:user)}
    let(:course) { FactoryGirl.create(:course)}

    it 'should have many courses' do
      user.courses << course << course

      expect(user.courses.length).to be(2)
    end

    it 'should validate an email address' do
      pending
    end

    it 'should validate a possword against encrypted' do
      pending
    end
  end
end