class TagsController < ApplicationController
  def from_dream
    dream = Dream.find(params['dream_id'])
    themes = dream.themes
    @tags = themes.map { | theme | theme.tag }
    render json: @tags
  end
end
