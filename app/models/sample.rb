class Sample < ActiveRecord::Base
  belongs_to :project
  delegate :principal_investigator, :to => :project, :allow_nil => true

  def self.import file
    # ensure file is readable
    file.rewind

    CSV.foreach(file.path, { :headers => true, :col_sep => "\t"  }) do |row|

      # create principal investor from hash of attributes
      principal_investor = PrincipalInvestigator.create(principal_investor_attributes(row[0]))

      # create project from hash of attributes
      project = Project.create(project_attributes(row[1]))

      # associate project with principal investor
      principal_investor.projects << project

      # create sample from hash of attributes
      sample = Sample.create(sample_attributes(row))

      # associate sample with project
      project.samples << sample
    end
  end

  def self.principal_investor_attributes full_name
    first_name = full_name.split(" ").first
    last_name = full_name.split(" ").last
    { "first_name" => first_name, "last_name" => last_name }
  end

  def self.project_attributes number
    { "number" => number }
  end

  def self.sample_attributes row
    identifier = row[2]
    total_reads = row[3]
    average_q_score = row[4]
    percent_five_x_coverage = row[5]
    percent_ten_x_coverage = row[6]
    percent_twenty_x_coverage = row[7]
    percent_thirty_x_coverage = row[8]
    { "identifier" => identifier, "total_reads" => total_reads, "average_q_score" => average_q_score, "percent_five_x_coverage" => percent_five_x_coverage, "percent_ten_x_coverage" => percent_ten_x_coverage, "percent_twenty_x_coverage" => percent_twenty_x_coverage, "percent_thirty_x_coverage" => percent_thirty_x_coverage }
  end
end