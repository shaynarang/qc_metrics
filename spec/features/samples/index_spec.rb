require 'rails_helper'

RSpec.describe "index" do
  context "sample display" do
    before(:each) do
      file = Rack::Test::UploadedFile.new("spec/support/files/test.txt", "text/txt")
      Sample.import(file)
      visit root_url
    end

    it "displays the title" do
      expect(page).to have_content("Samples")
    end

    it "displays the table headers" do
      expect(page).to have_content("Principal Investigator")
      expect(page).to have_content("Project Number")
      expect(page).to have_content("Identifier")
      expect(page).to have_content("Total Reads")
      expect(page).to have_content("Average Q Score")
      expect(page).to have_content("Percent 5x Coverage")
      expect(page).to have_content("Percent 10x Coverage")
      expect(page).to have_content("Percent 20x Coverage")
      expect(page).to have_content("Percent 30x Coverage")
    end

    it "displays the imported samples" do
      expect(page).to have_content("Marley Hodges 9001  9001-MH-1 52220 26  95  87  78  61")
      expect(page).to have_content("Marley Hodges 9001  9001-MH-1 52220 26  95  87  78  61")
      expect(page).to have_content("Marcie Garrett  9002  9002-MG-9 57318 21  98  86  73  68")
      expect(page).to have_content("Ruadhi Gilliam  9003  9003-RG-1 56004 28  95  94  84  62")
      expect(page).to have_content("Mike Bordie 9004  9004-MB-11  55248 26  98  89  74  63")
      expect(page).to have_content("Lesia Cliton  9005  9005-LC-1 53360 25  96  91  77  65")
      expect(page).to have_content("Ruadhi Gilliam  9006  9006-RG-1 55120 23  96  90  78  66")
      expect(page).to have_content("Marcie Garrett  9008  9008-MG-14  50997 23  96  94  82  62")
      expect(page).to have_content("Ruadhi Gilliam  9030  9030-RG-20  52849 27  97  86  79  64")
    end
  end

  context "sample upload" do
    before(:each) do
      visit root_url
    end

    it "displays the form to upload a file" do
      expect(page).to have_selector("form input#file")
      expect(page).to have_selector('form input[type="submit"][value="Import"]')
    end

    it "uploads a file" do
      expect(page).to_not have_content("Marley Hodges 9001  9001-MH-1 52220 26  95  87  78  61")
      attach_file "file", "spec/support/files/test.txt"
      click_button "Import"
      expect(page).to have_content("Samples imported!")
      expect(page).to have_content("Marley Hodges 9001  9001-MH-1 52220 26  95  87  78  61")
    end
  end
end