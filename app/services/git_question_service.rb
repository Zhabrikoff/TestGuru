class GitQuestionService
  ResponseObject = Struct.new(:html_url, :success?)

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    result = @client.create_gist(gist_params)
    ResponseObject.new(result.html_url, result.html_url.present?)
  end

  private

  def gist_params
    {
      description: I18n.t("services.gist_question.description", title: @test.title),
      files: {
        'test-guru-question.txt': {
          content: gist_content,
        },
      },
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV["GITHUB_GIST_ACCESS_TOKEN"])
  end
end
