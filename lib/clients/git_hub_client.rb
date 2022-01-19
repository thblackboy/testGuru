class GitHubClient
  ACCESS_TOKEN = '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'

  def initialize
    @octokit_client = setup_octokit_client
  end

  def create_gist(params)
    @octokit_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_octokit_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
