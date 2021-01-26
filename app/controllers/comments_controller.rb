class CommentsController < ApplicationController
    def index
    end
    
    def show
        @comment =Comment.all
    end
    
    def create
         Comment.create( address: comment_params[:address],comment: comment_params[:comment])
    end
    
    def destry
        @comment = Comment.find(params[:id])
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
