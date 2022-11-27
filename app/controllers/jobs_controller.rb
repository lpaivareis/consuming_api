class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:user_apply_job]

  def index
    @jobs = RequestService.call(:get, "jobs")
  end

  def show
    @job = RequestService.call(:get, "jobs/#{job_params[:id]}")
  end

  def user_apply_job
    if ApplyJobService.call(job_params[:id], current_user.id).present?
      flash[:notice] = "You have successfully applied for this job"
    else
      flash[:error] = "You already applied for this job"
    end
  end

  private

  def job_params
    params.permit(:id)
  end
end