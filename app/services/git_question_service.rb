class GitQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @result = @client.create_gist(gist_params)
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
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
