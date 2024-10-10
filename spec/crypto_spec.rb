require_relative "../lib/crypto.rb"

describe "the main function" do
  it "returns an array" do
    expect(main).to be_a(Array)
  end

  it "returns an array of Hash" do
    expect(main).to all(be_a(Hash))
  end

  it "returns more than one cryptocurrency" do
    expect(main().length).to be > 1
  end
end
