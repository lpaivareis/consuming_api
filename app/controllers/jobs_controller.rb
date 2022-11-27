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
      redirect_to job_path(job_params[:id]), flash:{ notice: "Você se candidatou com sucesso." }
    else
      redirect_to job_path(job_params[:id]), flash:{ notice: "Você ja está candidatado nessa vaga." }
    end
  end

  private

  def job_params
    params.permit(:id)
  end
end