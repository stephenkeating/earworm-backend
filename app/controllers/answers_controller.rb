class AnswersController < ApplicationController

  def index
    @answers = Answer.all
    render json: @answers, include: "**"
  end

  def show
    @answer = Answer.find(params[:id])
    render json: @answer
  end

  def create
    @answer = Answer.create(answer_params)
    render json: @answer
  end

  def update
    @answer.update(answer_params)

    render json: @answer
  end

  def destroy
    @answer = answer.find(params[:id])
    @answer.destroy
    render json: {status: 'SUCCESS', message: 'deleted the answer', data: @answer}
  end

  private

  def answer_params
    params.permit(:user)
  end

end
