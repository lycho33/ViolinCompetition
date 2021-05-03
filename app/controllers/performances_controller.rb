class PerformancesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @performances = Performance.all
    end

    def new
        @performance = Performance.new
    end

    def create
        @performance = current_user.performances.build(performance_params)
        @performance.user_id = current_user.id

        if @performance.save
            redirect_to performance_path(@performance)
        else
            render :new
        end
    end

    def show
        @performance = Performance.find_by(id: params[:id])
        @comments = @performance.comments
        @comment = Comment.new
    end

    def edit
        @performance = Performance.find_by(id: params[:id])
    end

    def update
        @performance = Performance.find_by(id: params[:id])
        @performance.update(performance_params)
        if @performance.save
            redirect_to performance_path(@performance)
        else
            render :edit
        end
    end

    def destroy
        @performance = Performance.find_by(id: params[:id])
        @performance.destroy
        flash[:message] = "Performance Post was deleted"
        redirect_to performances_path
    end

    private
    def performance_params
        params.require(:performance).permit(:performer, :division, :round, :date, :piece, :video)
    end
end
