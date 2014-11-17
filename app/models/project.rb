class Project < ActiveRecord::Base
  belongs_to :principal_investigator
  has_many :samples
end