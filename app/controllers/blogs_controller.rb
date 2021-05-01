class BlogsController < ApplicationController
    before_action :find_user, only: [:new, :create, :show]
    def index
        @blogs = current_user.blogs
        @user = current_user.id
    end

    def show
        if params[:user_id]
            @blog = @user.blogs.find_by(id: params[:id])
            if @blog.nil?
                redirect_to user_blogs_path(@user)
            end
        else
            @blog = Blog.find_by(id: params[:id])
        end
    end

    def new
        if @user
            @blog = @user.blogs.build
        else
            @blog = Blog.new
        end
    end

    def create
        @blog = @user.blogs.build(blog_params)
        if @blog.save
            redirect_to user_blog_path(@blog)
        else
            render :new
        end
    end

  
    private
    def blog_params
        params.require(:blog).permit(:title, :date, :content, :user_id)
    end
    def find_user
        @user = User.find_by_id(params[:user_id])
    end
end
