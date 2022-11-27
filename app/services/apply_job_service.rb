class ApplyJobService < ApplicationService
  attr_reader :job, :user_id, :user

  def initialize(job, user_id)
    @job = job
    @user_id = user_id
  end

  def call
    find_user

    apply
  end

  private
  
  def apply
    return false if user.jobs.include?(job)

    user.jobs << job
    user.save

    return true
  end

  def find_user
    @user = User.find_by_id(user_id)
  end
end