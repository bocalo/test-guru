class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new show destroy]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    #@question = @test.questions.all
    #render plain: 'All questions'
    #render html: '<h1>All questions</h1>'.html_safe
    #render json: { questions: Question.all }
    render json: Question.all 
  end

  def show
    question = Question.find_by(id: params[:id])
    render json: question
  end

  def new
    #@question = Question.new
    #@question = test.questions.new
  end

  def create
    #@question = @test.questions.new(question_params)
    question = Question.new(question_params)

    if question.save
      render plain: Question.inspect
    else
      render json: question.errors.full_messages, status: :unprocessable_entity
    end

    # if @question.save
    #   #redirect_to question_path(@question.id)
    #   redirect_to @question
    # else
    #   render :new
    # end
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
