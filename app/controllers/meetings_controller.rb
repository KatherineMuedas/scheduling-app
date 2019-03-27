class MeetingsController < ApplicationController
before_action :authenticate_user!
before_action :set_meeting, except: [:index, :new, :create]

  def index
    @meetings = current_user.meetings.all
  end

  def show
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user_id = current_user.id

    respond_to do |format|
      if @meeting.save
        format.html {redirect_to @meeting, notice: "Meeting was successfully created."}
        format.json {render :show, status: :created, location: @meeting}
      else
        format.html {render :new}
        format.json {render json: @meeting.erros, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private

  def set_meeting
    @meeting = Meeting.friendly.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :user_id)
  end
end
