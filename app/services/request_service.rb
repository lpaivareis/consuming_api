class RequestService < ApplicationService
  class BadRequest < StandardError; end

  attr_reader :method, :path, :response

  def initialize(method, path)
    @method = method
    @path = path
  end

  def call
    request(method, path, default_options)
  end

  private

  def default_url(path)
    URI.join(ENV["BASE_URL"], path).to_s
  end

  def default_options
    {
      headers: {
        'Content-Type' => 'application/json'
      }
    }
  end

  def request(method, path, options)
    @response = HTTParty.send(method, default_url(path), options)

    raise BadRequest if response.bad_request?

    response
  end
end