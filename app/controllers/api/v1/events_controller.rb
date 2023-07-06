class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: %i[ show update destroy ]
  before_action :set_start_date, only: %i[ date_range ]
  before_action :set_end_date, only: %i[ date_range ]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  def date_range
    @events = Event.where(duedate: [@start_date..@end_date])

    render json: @events
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: api_v1_calendar_url(@event)
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_start_date
      start_date_array = params[:start_date].split('-')
      year = start_date_array[0].to_i
      month = start_date_array[1].to_i
      day = start_date_array[2].to_i
      @start_date = DateTime.new(year,month,day)
    end

    def set_end_date
      p end_date_array = params[:end_date].split('-')
      p year = end_date_array[0].to_i
      p month = end_date_array[1].to_i
      p day = end_date_array[2].to_i
      @end_date = DateTime.new(year,month,day)
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :guests, :location, :duedate, :calendar_id)
    end
end
