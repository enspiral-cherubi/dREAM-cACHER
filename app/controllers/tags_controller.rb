class TagsController < ApplicationController
  def from_dream
    dream = Dream.find(params[:dream_id])
    @tags = dream.tags.where("dreams_count > ?", 1)
    render json: @tags
  end
end
