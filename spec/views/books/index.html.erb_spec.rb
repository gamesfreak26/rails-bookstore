require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        name: "Name",
        description: "MyText",
        price: 2.5,
        genre: nil
      ),
      Book.create!(
        name: "Name",
        description: "MyText",
        price: 2.5,
        genre: nil
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
