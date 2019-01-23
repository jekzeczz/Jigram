class PostsController < ApplicationController
    before_action :authenticate_user!
    layout "post", only: [:show, :write, :modify]
    def show
        @posts = Post.where(user_id: current_user.id).order("created_at DESC")
    end
    
    def write
    end
    
    def create
        @post = Post.new(permit_params)
        @post.save
        
        redirect_to action: 'show'
    end
    
    def delete
        Post.destroy(params[:post_id])
        
        redirect_to action: 'show'
    end
    
    def modify
        @post = Post.find(params[:post_id])
    end
    
    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(permit_params)
          # 更新に成功したときの処理
        else
          render 'edit'
        end
        
        redirect_to action: 'show'
    end
    
    private
        def permit_params
          params.require(:post).permit(:username, :image, :caption, :user_id)
        end
end
