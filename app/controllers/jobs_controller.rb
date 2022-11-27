class JobsController < ApplicationController
  def index
    @jobs = RequestService.call(:get, "jobs")
  end

  def show
    @job = RequestService.call(:get, "jobs/#{job_params[:id]}")
  end

  private

  def job_params
    params.permit(:id)
  end
end