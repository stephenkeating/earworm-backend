class GamesController < ApplicationController

  def index
    @games = Game.all
    render json: @games, include: "**"
  end

  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  def create
    @game = Game.create(game_params)
    render json: @game
  end

  def update
    @game.update(game_params)

    render json: @game
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    render json: {status: 'SUCCESS', message: 'deleted the game', data: @game}
  end

  private

  def game_params
    params.permit(:game_id, :track_id, :outcome)
  end

end
