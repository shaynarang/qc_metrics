class SamplesController < ApplicationController
  def index
    case params[:sort]
    when "principal_investigator"
      @samples = Sample.order_by_principal_investigator
    when "project_number"
      @samples = Sample.order_by_project_number
    when "passable"
      @samples = Sample.passable
    when "unpassable"
      @samples = Sample.unpassable
    else
      @samples = Sample.order(sort_column)
    end
  end

  def import
    if params[:file].blank?
      redirect_to root_url, :notice => "Please add a file to upload."
    else
      Sample.import(params[:file])
      redirect_to root_url, :notice => "Samples imported!"
    end
  end

  private
    def sort_column
      sample_columns = %w[identifier total_reads average_q_score percent_five_x_coverage percent_ten_x_coverage percent_twenty_x_coverage percent_thirty_x_coverage]
      sample_columns.include?(params[:sort]) ? params[:sort] : "created_at"
    end
end