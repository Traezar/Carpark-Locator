class ApplicationController < ActionController::API
    def show 
        post = Post.all
        render json: posts
    end
end
