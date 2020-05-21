require 'rails_helper'

RSpec.describe Order, type: :model do

  subject {create(:order, :with_items) }
  context "validations" do

    it "is valid with valid attributes" do
      puts subject.address
      puts subject.menu_items.count
      expect(subject).to be_valid
    end

    it "has 3 menu_items" do
      puts subject.address
      puts subject.menu_items.count
      expect(subject).to be_valid
    end

  end
end
