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
end
