class GitHubClient
  def initialize
    @client = Octokit::Client.new(access_token: ENV["GITHUB_GIST_ACCESS_TOKEN"])
  end

  def create_gist(params)
    result = @client.create_gist(params)

    if result.key?(:id)
      result.html_url
    else
      nil
    end
  end
end
