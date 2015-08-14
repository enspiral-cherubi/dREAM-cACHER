class DreamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @dreams = Dream.all
    render json: @dreams
  end

  def show
    @dream = Dream.find_by_id(params[:id])
    render json: @dream
  end

  def mine
    user = User.find_by_id(params[:user_id])
    @dreams = user.dreams.all
    render json: @dreams
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @dream = @user.dream.new(
      contents: params[:contents]
    )
    if @tip.save
      # render the dreamscape
    else
      # yoooooo something went wrong...
    end
  end

end
