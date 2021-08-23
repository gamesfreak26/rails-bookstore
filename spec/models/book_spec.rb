require 'rails_helper'

RSpec.describe Book, type: :model do
  context "validation tests" do
    # Create the book setup in the book factory before each test
    before(:each) do
      @book = create(:book)
    end

    it "is valid when given all attributes correctly" do
      expect(@book).to be_valid
    end

    it "is not valid when book does not have a name" do
      new_book = build(:book, name: nil)
      expect(new_book).to_not be_valid
    end

    it "is not valid when description is empty" do 
      new_book = build(:book, description: nil)
      expect(new_book).to_not be_valid
    end

    it "is not valid when description is over 250 chars long" do
      new_book = build(:book, description: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
      expect(new_book).to_not be_valid
    end

    it "is not valid when price is below 0" do
      new_book = build(:book, price: -5.6)
      expect(new_book).to_not be_valid
    end
  end
end
