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

  def new

  end

  def create
    @user = User.find(params[:user_id])
    @dream = @user.dreams.new(
      contents: params[:contents]
    )
    if @dream.save
      redirect_to dreamscape_path
    else
      # yoooooo something went wrong...
    end
  end

end
