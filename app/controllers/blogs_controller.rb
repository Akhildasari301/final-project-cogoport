class BlogsController < ApplicationController

    skip_before_action :verify_authenticity_token
    
    def get_all
        render json: Blog.all
    end

    def get_one 
        render json: Blog.find(params[:id])
    end


    def update
        t = Blog.find(params[:id])
        t.title = params[:title]
        t.content = params[:content]
        t.save
        render json: {"message": "success"}
    end

    def add
        render json: Blog.create(
            {
                title: params[:title],
                authorName: params[:authorName],
                content: params[:content],
                user_id: params[:user_id]
            }
        )
    end

    def delete
    end
end
