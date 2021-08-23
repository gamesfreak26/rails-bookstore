require 'rails_helper'

RSpec.describe Genre, type: :model do
  context "validation tests" do
    
    before(:each) do
      @genre = create(:genre)
    end
    
    it "should be valid when adding attributes correctly" do
      expect(@genre).to be_valid
    end

    it "should not be valid when not adding a name" do
      new_genre = build(:genre, name: nil)
      expect(new_genre).to_not be_valid
    end
  end
end
