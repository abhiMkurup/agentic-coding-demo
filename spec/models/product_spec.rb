require "rails_helper"

RSpec.describe Product, type: :model do
  it "is valid with a name and non-negative inventory" do
    expect(build_stubbed(:product)).to be_valid
  end

  it "requires a name" do
    expect(build_stubbed(:product, name: "")).not_to be_valid
  end

  it "rejects negative inventory" do
    expect(build_stubbed(:product, inventory_count: -1)).not_to be_valid
  end

  it "accepts zero inventory (out of stock)" do
    expect(build_stubbed(:product, inventory_count: 0)).to be_valid
  end
end
