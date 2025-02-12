class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:show, :edit, :update, :destroy] # ✅ ใช้ before_action

  # GET /rooms
  def index
    @rooms = Room.all
    @room = @rooms.first # ✅ กำหนดให้ `@room` มีค่าเริ่มต้น
    @messages = @room.present? ? @room.messages : [] # ✅ ป้องกัน `nil` error
  end

  # GET /rooms/1
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_path, notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to rooms_path, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  def destroy
    if @room.present?
      @room.destroy!
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to rooms_path, notice: "Room was successfully destroyed.", status: :see_other }
        format.json { head :no_content }
      end
    else
      redirect_to rooms_path, alert: "❌ ไม่พบห้องที่ต้องการลบ"
    end
  end

  private

  # ✅ ใช้ `before_action` เพื่อกำหนดค่า `@room`
  def set_room
    @room = Room.find_by(id: params[:id]) # ✅ ใช้ `find_by` ป้องกัน `nil` error
  end

  # ✅ ป้องกัน Parameter Injection ด้วย `require(:room)`
  def room_params
    params.require(:room).permit(:name)
  end
end
