class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new #not needed?
    end

    def create
        @performance = Performance.find_by_id(params[:performance_id])
        @comment = @performance.comments.build(comment_params)
        if @comment.save
            flash[:message] = "Yay! You just commented"
            redirect_to performance_path(@performance)
        else
            flash[:message] = "Aw you couldn't comment. Try again."
            redirect_to performance_path(@performance)
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :performance_id, :user_id)
    end
end
