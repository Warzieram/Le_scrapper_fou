require_relative "../lib/mairie_christmas.rb"

test_url = "https://www.aude.fr/annuaire-mairies-du-departement/mairie-aigues-vives"



describe "get_townhall_email" do
  it "returns a string" do
    expect(get_townhall_email(test_url)).to be_a(String)
  end

  it "returns the right result for test url" do
    expect(get_townhall_email(test_url)).to eq("mairie-aiguesvives@wanadoo.fr")
  end

end

describe "get_townhall_urls" do
  townhalls_urls = get_townhalls_urls()
  it "returns an array" do
    expect(townhalls_urls).to be_a(Array)
  end

  it "returns the right ammount of results (24)" do
    expect(townhalls_urls.length).to be == 24
  end
end

describe "the main function" do
  array = main()
  it "returns an array of hash" do
    expect(array).to be_a(Array)
    expect(array).to all(be_a(Hash))
  end

  it "returns the right ammount of couples (24)" do
    expect(array.length).to be == 24
  end
end