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

  describe "class methods" do
    before(:all) do
      file = Rack::Test::UploadedFile.new("spec/support/files/test.txt", "text/txt")
      Sample.import(file)
      @row_array = []
      CSV.foreach(file.path, { :headers => true, :col_sep => "\t"  }) do |row|
        @row_array.push(row)
      end
    end

    context "scopes" do
      it "orders by principal investigator last name" do
        last_names = Sample.order_by_principal_investigator.pluck(:last_name)
        expect(last_names).to eq(["Bordie", "Cliton", "Garrett", "Garrett", "Gilliam", "Gilliam", "Gilliam", "Hodges"])
      end

      it "orders by project number" do
        project_numbers = Sample.order_by_project_number.pluck(:number)
        expect(project_numbers).to eq([9001, 9002, 9003, 9004, 9005, 9006, 9008, 9030])
      end
    end

    context "import" do
      it "creates the correct amount of principal investigators" do
        expect(PrincipalInvestigator.count).to eq(5)
      end

      it "creates the correct amount of projects" do
        expect(Project.count).to eq(8)
      end

      it "creates the correct amount of samples" do
        expect(Sample.count).to eq(8)
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
