class Api::V1::MessagesController < Api::ApiV1Controller
  before_action :set_user, only: [:show]

  def index
    @messages = Message.all
  end

  def create
    @message = Message.create(message_params)
    interactor = PubnubInteractor.call("MyFirstChannel", @message)
    if interactor.success?
      render json: {
        success: true
      }
    else
      render json: {
        success: false,
        error: {
          message: interactor.error
        }
      }
    end
  end

  private
    def message_params
      params.require(:message).permit(:title, :body, :sender_id, :receiver_id)
    end

end
