class GamesController < ApplicationController

  def index
    # excluding games where there is no user for high score purposes
    @games = Game.all.where.not(user: nil)
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
    @game = Game.find(params[:id])
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
    params.permit(:user, :playlist_id)
  end

end
