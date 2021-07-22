class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new show destroy]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
    render plain: @questions.map { |el| "#{el.body}" }
  end

  def show
    
  end

  def new
    
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      render plain: Question.inspect
    else
      render json: question.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
