class CommentsController < ApplicationController

    def new
    end

    def create
        @performance = Performance.find_by_id(params[:performance_id])
        @comment = @performance.comments.build(comment_params)
        if @comment.save
            redirect_to performance_path(@performance)
        else
            redirect_to performance_path(@performance)
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :performance_id, :user_id)
    end
end
