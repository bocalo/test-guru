class GistQuestionService

  #CREATE_STATUS_REQUEST = 201

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
    #@client = client || Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end
  
  def call
    @client.create_gist(gist_params)
  end

  # def success?
  #   @client.last_response.status == CREATE_STATUS_REQUEST
  # end

  private

  def gist_params
    {
      description: I18n.t('.services.gist_question_service.text', title: @test.title),
      files: {
        I18n.t('.services.gist_question_service.file') => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
