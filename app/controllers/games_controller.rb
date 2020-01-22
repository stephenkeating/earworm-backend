class GamesController < ApplicationController
  # attr_accessor :score

  def index
    @games = Game.all.where.not(user: nil)
    render json: @games, include: "**"
  end

  # .answers.where(outcome: 'Earworm!').count
  # item = Item.find(params[:id])
  # item["message"] = "it works"
  # render :json => item.to_json
  def show
    @game = Game.find(params[:id])
    # @game['score'] = Game.find(params[:id]).answers.where(outcome: 'Earworm!').count
    # render json: @game 
    # render json: {game: @game, score: @score}
    render json: @game
    # render :json => @game.to_json
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
