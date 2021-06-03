class Api::V1::UsersController < ApiController
  skip_before_action :authenticate_user!

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
    avatar = params[:user][:avatar]
    params = user_params.except(:avatar)
    user = User.create(params)
    user.avatar.attach(avatar) if avatar.present?
    url = User.avatar_url(user.avatar)

    if user.save
      render json: { token: JsonWebToken.encode(sub: user.id), avatar_url: url}, status: 200
    else
      render json: { message: user.errors.full_messages }, status: 400
    end
  end

  def show
    user = User.find(params[:id])
    url = User.avatar_url(user.avatar)
    favourites = user.favourited_houses
    response = { user: user, favourites: favourites, avatar_url: url }
    render json: response
  end

  def edit
    user = User.find(params[:id])
  end

  def update
    avatar = params[:user][:avatar]
    params = user_params.except(:avatar)
    user = User.find(params[:id])
    user.avatar.attach(avatar) if avatar.present?
    url = User.avatar_url(user.avatar)
    if user.update(params)
      render json: { user: user, avatar_url: url}, status: 200
    else
      render json: { message: ['User was not updated!'] } , status: 400
    end
  end

 

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end


end
