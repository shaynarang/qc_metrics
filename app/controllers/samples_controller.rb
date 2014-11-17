class SamplesController < ApplicationController
  def index
    @samples = Sample.all
  end

  def import
    Sample.import(params[:file])
    redirect_to root_url, :notice => "Samples imported!"
  end
end