# frozen_string_literal: true

module ApplicationHelper
  def format_remuneration(value, value_period)
    return "N/A" if value.nil? || value_period.nil?

    "#{value}/#{value_period}"
  end

  def format_value_description(job)
    return "" if job.blank?

    "#{format_remuneration(job.value, job.value_period)} • #{job.clinic.name}"
  end

  def format_city(clinic)
    return "" if clinic.blank?

    "#{clinic.city}/#{clinic.state}"
  end
end
