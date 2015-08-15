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
    @dream = Dream.new
  end

  def create
    puts "**" * 30
    puts params[:dream]
    @user = User.find(current_user.id)
    @dream = Dream.new({
      contents: params[:dream]["contents"],
      user_id: current_user.id
    })
    if @dream.save
      redirect_to dreamscape_path
    else
      # yoooooo something went wrong...
    end
  end

end
