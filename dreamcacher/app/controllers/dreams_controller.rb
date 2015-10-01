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
    dream_string = params['dream']
    Sentimental.load_defaults
    Sentimental.threshold = 0.1
    analyzer = Sentimental.new
    @user = current_user || User.find_by_name('anonymous')
    @dream = Dream.new({
      contents: dream_string,
      user_id: @user.id,
      sentiment: ((analyzer.get_score dream_string) / 10)
    })
    if @dream.save
      render json: @drean
    else
      render json: ({error: 'shiiiiit fuck up!'})
    end
  end

end
