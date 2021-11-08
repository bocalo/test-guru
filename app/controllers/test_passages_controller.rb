class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  # def update
  #   @test_passage.accept!(params[:answer_ids])
    
  #   if @test_passage.completed?
  #     TestsMailer.completed_test(@test_passage).deliver_now

  #     BadgeService.new(@test_passage).call if @test_passage.passed?
  #     redirect_to result_test_passage_path(@test_passage)
  #   else
  #     render :show
  #   end
  # end

  def update
    if @test_passage.time_left <= 0
      @test_passage.accept!(params[:answer_ids])
       TestsMailer.completed_test(@test_passage).deliver_now
      

      redirect_to result_test_passage_path(@test_passage)
    else
      @test_passage.accept!(params[:answer_ids])

      if @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now

        BadgeService.new(@test_passage).call if @test_passage.passed?
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    end
  end

  def result
  end

  def gist
    response = GistQuestionService.new(@test_passage.current_question)
    result = response.call
    @gist = current_user.gists.new(gist_url: result.html_url, user_id: current_user.id, question_id: @test_passage.current_question.id)

    flash_options = response.success? && @gist.save ? { notice: t('.success')} : { alert: t('.failure')}
    
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
