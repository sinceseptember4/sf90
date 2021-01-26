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
    
  
   private
  def comment_params
    params.permit(:comment, :address)
  end
end
