require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  subject { build(:menu_item)}

  context "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it ".active is false by default" do
      puts subject.category.id
      expect(subject.active).to be false
    end

    it "is not valid with an empty negative cost" do
      subject.price = -5
      expect(subject).to_not be_valid
    end
  end
end
