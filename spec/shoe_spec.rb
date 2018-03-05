require('spec_helper')

describe(Shoe) do
  it {should have_and_belong_to_many(:stores)}

  it("converts the first letter of each word to be an uppercase letter") do
    shoe = Shoe.create({:brand => "nike"})
    expect(shoe.titleize_name()).to(eq("Nike"))
  end

  it("validates presence of a shoe brand") do
    shoe1 = Shoe.new({:brand => ""})
    expect(shoe1.save()).to(eq(false))
  end

  it("ensures the shoe brand length is at most 100 characters") do
    new_shoe = Shoe.new({:brand => "c"*(101)})
    expect(new_shoe.save()).to(eq(false))
  end

end
