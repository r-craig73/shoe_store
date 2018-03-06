require('spec_helper')

describe(Store) do
  it {should have_and_belong_to_many(:shoes)}

  it("converts the first letter of each word to be an uppercase letter") do
    store = Store.create({:name => "east wildwood"})
    expect(store.titleize_name()).to(eq("East Wildwood"))
  end

  it("validates presence of a store name") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end

  it("ensures the store name length is at most 100 characters") do
    store32 = Store.new({:name => "d"*(101)})
    expect(store32.save()).to(eq(false))
  end

  it("ensures the store name is unique") do
    store1 = Store.new({:name => "Northeast Portland"})
    store2 = Store.new({:name => "Northeast Portland"})
    expect(store1 == store2).to(eq(false))
    expect(store1 == store3).to(eq(false))
  end

end
