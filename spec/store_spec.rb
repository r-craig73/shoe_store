require('spec_helper')

describe(Store) do
  it {should have_and_belong_to_many(:shoes)}

  it("converts the first letter of each word to be an uppercase letter") do
    store = Store.create({:name => "wildwood"})
    expect(store.titleize_name()).to(eq("Wildwood"))
  end
end
