class TestsController < ApplicationController

  after_action :send_log_message
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
    render json: @tests
  end

  def show
    @test = Test.find(params[:id])
    render inline: '<%= @test.title %>'
  end

  def new
    
  end

  def create
    test = Test.create(test_params)

    if @question.save
      render plain: test.title
    else
      render json: question.errors.full_messages, status: :unprocessable_entity
    end

    render plain: test.inspect
  end

  private

  def send_log_message
    logger.info("Action[#{action_name}] was finished")
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start

    logger.info("Execution time: #{finish * 1000}ms")
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end
