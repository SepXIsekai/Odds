class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: %i[destroy]

  # GET /messages or /messages.json
  def index
    if params[:room_id]
      @room = Room.find(params[:room_id])
      @messages = @room.messages
    else
      @messages = []
    end
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = current_user.messages.build(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message.room }
        format.json { render :show, status: :created, location: @message }
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("message-list", partial: "messages/message", 
            locals: { message: @message, current_user: current_user })
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    if @message.present?
      @message.destroy!
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.remove(@message)
        end
        format.html { redirect_to messages_path, status: :see_other, notice: "Message was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to messages_path, alert: "Message not found."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find_by(id: params[:id])
    redirect_to messages_path, alert: "Message not found." if @message.nil?
  end
end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content, :room_id)
    end

