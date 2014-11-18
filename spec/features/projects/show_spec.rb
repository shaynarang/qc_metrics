require "rails_helper"

RSpec.describe "show" do
  before(:each) do
    file = Rack::Test::UploadedFile.new("spec/support/files/test.txt", "text/txt")
    Sample.import(file)
    visit project_url(Project.first.id)
  end

  it "displays the project number and principal investigator" do
    expect(page).to have_content("Project Number: 9001")
    expect(page).to have_link("Marley Hodges")
  end
  
  it "displays the table headers" do
    expect(page).to have_content("Identifier")
    expect(page).to have_content("Total Reads")
    expect(page).to have_content("Average Q Score")
    expect(page).to have_content("Percent 5x Coverage")
    expect(page).to have_content("Percent 10x Coverage")
    expect(page).to have_content("Percent 20x Coverage")
    expect(page).to have_content("Percent 30x Coverage")
  end

  it "displays the samples particular to the project" do
    expect(page).to have_content("9001-MH-1 52220 26  95  87  78  61")
  end
end