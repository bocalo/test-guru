class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  # ACCESS_TOKEN = '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'
  

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      #request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Authorization'] = "token #{ENV['ACCESS_TOKEN']}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
