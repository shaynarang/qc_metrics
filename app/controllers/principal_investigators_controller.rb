class PrincipalInvestigatorsController < ApplicationController
  def show
    @principal_investigator = PrincipalInvestigator.find(params[:id])
  end
end