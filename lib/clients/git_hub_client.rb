# frozen_string_literal: true

class GitHubClient\
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = 'ddd7adc9a7a8dad08cdfd841896f79242aaee31f'

  def initialize
    @http_client = setup_http_clinet
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_clinet
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
