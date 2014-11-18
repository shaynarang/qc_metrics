class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @project_samples = @project.samples.order(:created_at)
  end
end