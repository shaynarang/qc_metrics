class Sample < ActiveRecord::Base
  belongs_to :project
  delegate :principal_investigator, :to => :project, :allow_nil => true
end