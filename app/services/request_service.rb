# frozen_string_literal: true

class RequestService < ApplicationService
  class BadRequest < StandardError; end

  attr_reader :method, :path, :response

  def initialize(method, path)
    @method = method
    @path = path
  end

  def call
    format_response
  end

  private

  def format_response
    request(method, path, default_options)

    JSON.parse(response.body, symbolize_names: true, object_class: OpenStruct)
  end

  def default_url(path)
    URI.join(ENV.fetch("BASE_URL", nil), path).to_s
  end

  def default_options
    {
      headers: {
        "Content-Type" => "application/json"
      }
    }
  end

  def request(method, path, options)
    @response = HTTParty.send(method, default_url(path), options)

    raise BadRequest if response.bad_request?
  end
end
