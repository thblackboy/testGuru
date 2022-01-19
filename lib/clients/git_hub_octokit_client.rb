class GitHubOctokitClient
  def initialize
    @octokit_client = setup_octokit_client
  end

  def create_gist(params)
    @octokit_client.create_gist(params)
  rescue StandardError
    nil
  end

  private

  def setup_octokit_client
    Octokit::Client.new(access_token: Rails.application.credentials.git_hub_api_key)
  end
end
