class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  def done
    @event = Event.find(params[:event_id])
    @event.done!

    respond_to do |format|
      if @event.save
        format.html {redirect_to event_url(@event, notice: "Event was succesfully updated to Done statue.")}
        format.json {render :show, status: :updated, location: @event}
      else
        format.html {redirect_to events_url(notice: "Failed to update Event#{@event.id} status")}
        format.json {render json: @event.errors, status: :unprocessable_entity}
      end
    end
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def certain_plumber_events
    @plumber = Plumber.find params[:plumber_id]
    @events = Event.where(plumber_ids: params[:plumber_id])
    pp @events.count
    if params[:start_date].present?
      @events = @events.where(:start_date.gte => params[:start_date])
    end

    if params[:end_date].present?
      @events = @events.where(:end_date.lte => params[:end_date])
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.permit(:client, :start_date, :end_date, :plumber_id, plumber_ids: [])
    end
end
