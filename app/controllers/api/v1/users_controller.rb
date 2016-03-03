class Api::V1::UsersController < Api::ApiV1Controller
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    PubnubManager.publish("MyFirstChannel", @user)
  end

  def show
    case params[:type]
    when "sent"
      @messages = Message.where(sender_id: @user)
    when "received"
      @messages = Message.where(receiver_id: @user)
    else
      @messages = []
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end

end
