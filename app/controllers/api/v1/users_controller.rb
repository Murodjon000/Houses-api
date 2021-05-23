class Api::V1::UsersController < ApiController
  before_action :ensure_params_exist, only: :create
  skip_before_action :authenticate_user!, only: %i[create user_params ensure_params_exist]
  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    user = User.new(user_params)
    if user.save
      render json: { token: JsonWebToken.encode(sub: user.id), data: { user: user } }
    else
      render json: { errors: ['Invalid email or password'] },  status: :unprocessable_entity
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

  def ensure_params_exist
    return if params[:user].present?
    render json: {
        messages: "Missing Params",
      }, status: :bad_request
  end
end
