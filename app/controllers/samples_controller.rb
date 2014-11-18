class SamplesController < ApplicationController
  def index
    if params[:sort] == "principal_investigator"
      @samples = Sample.order_by_principal_investigator
    elsif params[:sort] == "project_number"
      @samples = Sample.order_by_project_number
    else
      @samples = Sample.order(sort_column)
    end
  end

  def import
    Sample.import(params[:file])
    redirect_to root_url, :notice => "Samples imported!"
  end

  private
    def sort_column
      sample_columns = %w[identifier total_reads average_q_score percent_five_x_coverage percent_ten_x_coverage percent_twenty_x_coverage percent_thirty_x_coverage]
      sample_columns.include?(params[:sort]) ? params[:sort] : "created_at"
    end
end