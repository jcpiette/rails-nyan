class NotifcationsController < ApplicationController
  before_action :set_notifcation, only: %i[ show edit update destroy ]

  # GET /notifcations or /notifcations.json
  def index
    @notifcations = Notifcation.all
  end

  # GET /notifcations/1 or /notifcations/1.json
  def show
  end

  # GET /notifcations/new
  def new
    @notifcation = Notifcation.new
  end

  # GET /notifcations/1/edit
  def edit
  end

  # POST /notifcations or /notifcations.json
  def create
    @notifcation = Notifcation.new(notifcation_params)

    respond_to do |format|
      if @notifcation.save
        format.html { redirect_to notifcation_url(@notifcation), notice: "Notifcation was successfully created." }
        format.json { render :show, status: :created, location: @notifcation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notifcation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifcations/1 or /notifcations/1.json
  def update
    respond_to do |format|
      if @notifcation.update(notifcation_params)
        format.html { redirect_to notifcation_url(@notifcation), notice: "Notifcation was successfully updated." }
        format.json { render :show, status: :ok, location: @notifcation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notifcation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifcations/1 or /notifcations/1.json
  def destroy
    @notifcation.destroy

    respond_to do |format|
      format.html { redirect_to notifcations_url, notice: "Notifcation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notifcation
      @notifcation = Notifcation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notifcation_params
      params.require(:notifcation).permit(:message, :is_read, :user_id)
    end
end
