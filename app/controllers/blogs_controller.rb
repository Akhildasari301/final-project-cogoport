require 'bcrypt'

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

        password2 = params[:password];
        # bcrypt.compare(password2, t.password_digest, function(err, result))
        # if result
        #     # console.log("It matches!")
        #     render json: {"message": "success"}
        
        # else 
        #     # console.log("Invalid password!");
        #     render json: {"message": "failure"}
        # end
        if BCrypt::Password.new(t.password_digest) == password2
            render json: {"message": "success"}
        else 
            render json: {"message": "failure"}
        end
    end

    def signup
        User.create(
            {
                name: params[:name],
                email: params[:email],
                password_digest: params[:password]  
            }
        )
        t = User.find_by(email: params[:email])
        render json: t.id
    end

    def get_random_blogs
        t = Blog.all
        # if t.length > 9
        #     t = t.sample(9)
        # end
        render json: t.sample(3)
    end

    
end
