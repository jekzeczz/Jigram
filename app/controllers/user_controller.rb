class UserController < ApplicationController
    def index
        @users = User.search(params[:search])
        render :layout => "post"
    end
end
