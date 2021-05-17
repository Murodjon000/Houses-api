class Api::V1::UsersController < ApiController
  skip_before_action :authenticate_user!, only: %i[create user_params]

  def create
    user = User.create!(user_params)
    if user
      render json: { token: JsonWebToken.encode(sub: user.id) }
    else
      render json: { errors: ["Invalid email or password"] }
    end
  end

  def show
    user = User.find(params[:id])
    favourites = user.favourites
    response = {user: user, favourites: favourites}
    render json: response
  end

  private

  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation)
  end

end