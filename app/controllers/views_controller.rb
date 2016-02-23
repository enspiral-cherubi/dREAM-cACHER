class ViewsController < ApplicationController
  before_action :authenticate_user!

  def create
    view = View.create(view_params)
    status = view.valid? ? 200 : 400
    render nothing: true, status: status
  end

  private
    def view_params
      params.require(:view).permit(:dream_id).merge(user: current_user)
    end
end
