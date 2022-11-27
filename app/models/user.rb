# frozen_string_literal: true

class User < ApplicationRecord
  serialize :jobs

  after_initialize do |user|
    user.jobs = [] if user.jobs.nil?
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
end
