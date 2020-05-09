require 'rails_helper'

describe User, type: :model do
  subject { build(:user)}

  context "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it 'encrypts the password' do
      expect(subject.encrypted_password).to be
    end

    it "is not valid with a long name" do
      subject.name = "Testuannna12345678901234567890123456789012345678901234567890100500"
      expect(subject).to_not be_valid
    end

    it "is not valid with a wrong phone format" do
      subject.phone = "call me 777-5556565"
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  context "admin is only first registrated" do
    before(:example) do
      create(:user)
      create(:second_user)
    end

    it "first registrated is admin" do
      expect(User.first.admin).to be true
    end

    it "second registrated is not admin" do
      expect(User.last.admin).to be false
    end
  end
end
