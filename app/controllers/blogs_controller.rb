class BlogsController < ApplicationController
    before_action :find_user

    def index
        @blogs = current_user.blogs
    end

    def new
        if @user
            @blog = @user.blogs.build
        else
            @blog = Blog.new
        end
    end

    def create
        @blog = current_user.blogs.build(blog_params)
        @blog.user_id = current_user.id
        if @blog.save
            redirect_to user_blog_path(@user, @blog)
        else
            render :new
        end
    end

    def show
        if params[:user_id]
            @blog = current_user.blogs.find_by(id: params[:id])
            if @blog.nil?
                redirect_to user_blogs_path(@user, @blog)
            end
        else
            @blog = Blog.find_by(id: params[:id])
        end
    end

    def edit
        @blog = current_user.blogs.find_by(id: params[:id])
    end

    def update
        @blog = current_user.blogs.find_by(id: params[:id])
        @blog.update(blog_params)
        if @blog.save
            redirect_to user_blogs_path(@blog)
        else
            render :edit
        end
    end

    def destroy
        @blog = Blog.find_by(id: params[:id])
        @blog.destroy
        flash[:message] = "Blog was deleted"
        redirect_to user_blogs_path
    end
  
    private
    def blog_params
        params.require(:blog).permit(:title, :date, :content, :user_id)
    end
    def find_user
        @user = User.find_by_id(params[:user_id])
    end
end
