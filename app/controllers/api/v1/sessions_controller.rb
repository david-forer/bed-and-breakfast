class Api::V1::SessionsController < ApplicationController

    def create 
        @user = User.find_by(email: params[:session][:email])

                if @user && @user.authenticate(params[:session][:password])
                    session[:user_id] = @user.id 
                    render json: {
                        status: :created,
                        logged_in: true,
                        user: @user
                      }
                else
                    render json: { status: 401 }
                end
    end

    def get_current_user
        if logged_in?
            render json: { status: 201, user: current_user, logged_in: true}
          else
            render json: { status: 400, user: {}, logged_in: false}
          end

    end

    def destroy 
        session.clear
        render json: {
            notice: "You Logged Out"
        }
    end


end


# @user = User.find_by(email: params[:session][:email])

#         if @user && @user.authenticate(params[:session][:password])
#             session[:user_id] = @user.id 
#             render json: {
#                 status: :created,
#                 logged_in: true,
#                 user: @user
#               }
#         else
#             render json: { status: 401 }
#         end

# user = User.find_by(email: params[:session][:email])

# if user && user.authenticate(params[:session][:password])
#   session[:id] = user.id
#   render json: { status: 201, user: user, logged_in: true}
# else
#   render json: { status: 401, message: 'User not found or password incorrect'}
# end

