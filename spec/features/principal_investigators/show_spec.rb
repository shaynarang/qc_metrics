require "rails_helper"

RSpec.describe "show" do
  before(:each) do
    file = Rack::Test::UploadedFile.new("spec/support/files/test.txt", "text/txt")
    Sample.import(file)
    investigator = PrincipalInvestigator.find_by_first_name("Ruadhi")
    visit principal_investigator_path(investigator.id)
  end

  it "displays the principal investigator" do
    expect(page).to have_content("Ruadhi Gilliam")
  end
  
  it "displays the projects particular to the investigator" do
    expect(page).to have_content("Project Number: 9003")
    expect(page).to have_content("Project Number: 9006")
    expect(page).to have_content("Project Number: 9030")
  end
end