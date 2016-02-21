class TagsController < ApplicationController
  def from_dream
    dream = Dream.find(params['dream_id'])
    themes = dream.themes
    @tags = themes.map { | theme | theme.tag }
    @tags.keep_if { | tag | tag.appears_more_than_once }
    render json: @tags
  end
end
