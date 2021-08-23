require 'rails_helper'

RSpec.describe Author, type: :model do
  context "validation tests" do 
    before(:each) do 
      @author = create(:author)
    end

    it "is valid when given all attributes correctly" do 
      expect(@author).to be_valid
    end

    it "is not valid when no name is given" do 
      new_author = build(:author, name: nil)
      expect(new_author).to_not be_valid
    end

    it "is not valid when the author's biography is over 250 chars long" do
      new_author = build(:author, biography: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
      expect(new_author).to_not be_valid
    end
  end
end
