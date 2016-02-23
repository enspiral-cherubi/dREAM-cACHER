class DreamsController < ApplicationController
  before_action :authenticate_user!, :only => [:mine]

  def index
    @dreams = Dream.order(created_at: :desc)
    render json: @dreams
  end

  def mine
    @dreams = current_user.dreams.order(created_at: :desc)
    render json: @dreams
  end

  def create
    user = current_user || User.find_by_name('anonymous')
    dream = DreamService.create(contents: params[:dream], user: user)

    if dream.valid?
      render json: dream
    else
      render json: { errors: dream.errors.full_messages }, status: 400
    end
  end

  def from_tag
    tag_word = params[:tag].downcase.strip
    tag = Tag.find_by_word(tag_word)
    render json: tag.dreams
  end
end
