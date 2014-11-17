require 'rails_helper'

describe PrincipalInvestigator do
  
  describe "associations" do
    subject { FactoryGirl.create(:principal_investigator) }
      it { should respond_to(:projects) }
      it { should respond_to(:samples) }
  end

  describe "associating" do
    let(:principal_investigator) { FactoryGirl.create(:principal_investigator) }
    let(:project) { FactoryGirl.create(:project) }
    let(:sample) { FactoryGirl.create(:sample) }

    before(:each) do
      principal_investigator.projects << project
      project.samples << sample
    end

    it "has many projects" do
      expect(principal_investigator.projects.first.id).to eq(project.id)
    end

    it "has many samples" do
      expect(principal_investigator.samples.first.id).to eq(sample.id)
    end
  end
end
