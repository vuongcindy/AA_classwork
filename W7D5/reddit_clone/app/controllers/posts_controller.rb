class PostsController < ApplicationController
    def destroy
        @post = Post.find(params[:id])
        @post.delete
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            render :show
        else
            flash[:errors] = @post.errors.all_messages
            redirect_to new_sub_post_url
        end
    end

    def new
        @post = Post.new
        render :new
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            render :show
        else
            flash[:errors] = ["Invalid information"]
            redirect_to edit_sub_post_url
        end
    end

    private
    def post_params
        params.require(:posts).permit(:title, :content)
    end
end
