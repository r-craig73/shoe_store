require('spec_helper')

describe(Shoe) do
  it {should have_and_belong_to_many(:stores)}

  it("converts the first letter of each word to be an uppercase letter") do
    shoe = Shoe.create({:brand => "nike"})
    expect(shoe.titleize_name()).to(eq("Nike"))
  end

end
