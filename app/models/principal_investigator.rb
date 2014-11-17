class PrincipalInvestigator < ActiveRecord::Base
  has_many :projects
  has_many :samples, :through => :projects
end