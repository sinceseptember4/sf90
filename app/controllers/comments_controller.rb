
class CommentsController < ApplicationController
    def index
      Comment.create(comment_params)
    end

    def show
      @comments =Comment.all
    end

    def create
    Comment.create(comment_params)
  end

    def destry
        @comments = Comment.find(params[:id])
    end

    def purchase
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      :amount => 500,
      :card => params['payjp-token'],
      :currency => 'jpy'
    )
  end

   private
  def comment_params
    params.permit(:comment, :address)
  end
end