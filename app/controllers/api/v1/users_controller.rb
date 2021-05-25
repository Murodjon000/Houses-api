class Api::V1::UsersController < ApiController
  skip_before_action :authenticate_user!, only: %i[create user_params ]

  def create
    if params[:user][:email].nil?
      render json: { message: ['User request must contain the user email.'] }, status: 400
      return
    elsif params[:user][:password].nil?
      render  json: { message: ['User request must contain the user password.'] }, status: 400
      return
    end

    if params[:user][:email]
      duplicate_user = User.find_by_email(params[:user][:email])
      unless duplicate_user.nil?
        render json: { message: ['Duplicate email. A user already exists with that email address.'] }, status: 409
        return
      end
    end

    @user = User.create(user_params)

    if @user.save
      render json: {status: 200, token: JsonWebToken.encode(sub: @user.id)}
    else
      render json: {message: @user.errors.full_messages}, status: 400
    end
  end

  def show
    user = User.find(params[:id])
    favourites = user.favourited_houses
    response = { user: user, favourites: favourites }
    render json: response
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
