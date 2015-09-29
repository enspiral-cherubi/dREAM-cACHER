class DreamsController < ApplicationController
before_action :authenticate_user!, :only => [:mine]

  def index
    @dreams = Dream.all
    render json: @dreams
  end

  def show
    @dream = Dream.find_by_id(params[:id])
    render json: @dream
  end

  def mine
    @dreams = current_user.dreams.all
    render json: @dreams
  end

  # def new
  # end

  def create
    Sentimental.load_defaults
    Sentimental.threshold = 0.1
    analyzer = Sentimental.new
    @user = User.find(current_user.id)
    @dream = Dream.new({
      contents: params[:dream]["contents"],
      user_id: current_user.id,
      sentiment: ((analyzer.get_score dreamString) / 10)
    })
    if @dream.save
      redirect_to dreamscape_path
    else
      # yoooooo something went wrong...
    end
  end

end
