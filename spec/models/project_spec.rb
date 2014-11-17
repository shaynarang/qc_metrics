require 'rails_helper'

describe Project do
  
  describe "associations" do
    subject { FactoryGirl.create(:project) }
      it { should respond_to(:principal_investigator) }
      it { should respond_to(:samples) }
  end

  describe "associating" do
    let(:project) { FactoryGirl.create(:project) }
    let(:principal_investigator) { FactoryGirl.create(:principal_investigator) }
    let(:sample) { FactoryGirl.create(:sample) }

    before(:each) do
      principal_investigator.projects << project
      project.samples << sample
    end

    it "belongs to a principal_investigator" do
      expect(project.principal_investigator.id).to eq(principal_investigator.id)
    end

    it "has many samples" do
      expect(project.samples.first.id).to eq(sample.id)
    end
  end
end
