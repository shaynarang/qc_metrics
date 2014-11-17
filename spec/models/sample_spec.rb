require 'rails_helper'

describe Sample do
  
  describe "associations" do
    subject { FactoryGirl.create(:sample) }
      it { should respond_to(:principal_investigator) }
      it { should respond_to(:project) }
  end

  describe "associating" do
    let(:sample) { FactoryGirl.create(:sample) }
    let(:principal_investigator) { FactoryGirl.create(:principal_investigator) }
    let(:project) { FactoryGirl.create(:project) }

    before(:each) do
      principal_investigator.projects << project
      project.samples << sample
    end

    it "belongs to a project" do
      expect(sample.project.id).to eq(project.id)
    end

    it "delegates principal investigator to project" do
      expect(sample.principal_investigator.id).to eq(principal_investigator.id)
    end
  end

  describe "import" do
    before(:all) do
      file = Rack::Test::UploadedFile.new("spec/support/files/test.txt", "text/txt")
      Sample.import(file)
    end

    it "creates the correct amount of principal investigators" do
      expect(PrincipalInvestigator.count).to eq(8)
    end

    it "creates the correct amount of projects" do
      expect(Project.count).to eq(8)
    end

    it "creates the correct amount of samples" do
      expect(Sample.count).to eq(8)
    end

    it "associates the correct project with the correct principal investigator" do
      expect(PrincipalInvestigator.first.projects.first.id).to eq(Project.first.id)
      expect(PrincipalInvestigator.last.projects.last.id).to eq(Project.last.id)
    end

    it "associates the correct sample with the correct project" do
      expect(Project.first.samples.first.id).to eq(Sample.first.id)
      expect(Project.last.samples.last.id).to eq(Sample.last.id)
    end
  end

  describe "attributes" do
    before(:all) do
      file = Rack::Test::UploadedFile.new("spec/support/files/test.txt", "text/txt")
      @row_array = []
      CSV.foreach(file.path, { :headers => true, :col_sep => "\t"  }) do |row|
        @row_array.push(row)
      end
    end

    context "principal_investor_attributes" do
      subject(:it) { Sample.principal_investor_attributes(@row_array[0][0]) }

      it "returns a hash" do
        expect(it).to be_kind_of(Hash)
      end

      it "includes a first name key value pair" do
        expect(it).to include({"first_name" => "Marley"})
      end

      it "includes a last name key value pair" do
        expect(it).to include({"last_name" => "Hodges"})
      end
    end

    context "project attributes" do
      subject(:it) { Sample.project_attributes(@row_array[0][1]) }

      it "returns a hash" do
        expect(it).to be_kind_of(Hash)
      end

      it "includes a number key value pair" do
        expect(it).to include({"number" => "9001"})
      end
    end

    context "sample_attributes" do
      subject(:it) { Sample.sample_attributes(@row_array[0]) }

      it "returns a hash" do
        expect(it).to be_kind_of(Hash)
      end

      it "includes an identifier key value pair" do
        expect(it).to include({"identifier" => "9001-MH-1"})
      end

      it "includes an average q score key value pair" do
        expect(it).to include({"average_q_score" => "26"})
      end

      it "includes a total reads key value pair" do
        expect(it).to include({"total_reads" => "52220"})
      end

      it "includes a percent five x coverage key value pair" do
        expect(it).to include({"percent_five_x_coverage" => "95"})
      end

      it "includes a percent ten x coverage key value pair" do
        expect(it).to include({"percent_ten_x_coverage" => "87"})
      end

      it "includes a percent twenty x coverage key value pair" do
        expect(it).to include({"percent_twenty_x_coverage" => "78"})
      end

      it "includes a percent thirty x coverage key value pair" do
        expect(it).to include({"percent_thirty_x_coverage" => "61"})
      end
    end
  end
end
