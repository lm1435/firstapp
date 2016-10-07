require 'rails_helper'

describe Product do
  before do
    @product = Product.create!(name:'race bike')
    @user = User.create!(email: 'spec@rspec.com', password: 'testing123')
    @product.comments.create!(rating: 1, user: @user, body: "awful bike!")
    @product.comments.create!(rating: 3, user: @user, body: "mediocre bike!")
    @product.comments.create!(rating: 5, user: @user, body: "awesome bike!")
  end
  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3
  end
  it "is an invalid product" do
    expect(Product.new(description: "nice BIKE")).not_to be_valid
end
