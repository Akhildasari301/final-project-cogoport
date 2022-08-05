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

    def get_his_own_blogs
        t = User.find(params[:id])
        render json: t.blogs
    end

    def delete
        t = Blog.find(params[:id])
        t.destroy
        render json: {"message": "success"}
    end

    def login
        t = User.find_by(email: params[:email])
        if t 
            render json: {"message": "success"}
            if t.password
        else
            render json: {"message": "failure"}
        end
    end

    def signup
        User.create(
            {
                name: params[:name],
                email: params[:email],
                password: params[:password]
                
            }
        )
        render json: {"message": "success"}
    end

    
end
