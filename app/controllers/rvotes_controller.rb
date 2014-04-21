class RvotesController < ApplicationController
  before_action :set_rvote, only: [:show, :edit, :update, :destroy]

  # GET /rvotes
  # GET /rvotes.json
  def index
    @rvotes = Rvote.all
  end

  # GET /rvotes/1
  # GET /rvotes/1.json
  def show
  end

  # GET /rvotes/new
  def new
    @rvote = Rvote.new
  end

  # GET /rvotes/1/edit
  def edit
  end

  # POST /rvotes
  # POST /rvotes.json
  def create
    @rvote = Rvote.new(rvote_params)

    respond_to do |format|
      if @rvote.save
        format.html { redirect_to @rvote, notice: 'Rvote was successfully created.' }
        format.json { render :show, status: :created, location: @rvote }
        format.js
      else
        format.html { render :new }
        format.json { render json: @rvote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rvotes/1
  # PATCH/PUT /rvotes/1.json
  def update
    respond_to do |format|
      if @rvote.update(rvote_params)
        format.html { redirect_to @rvote, notice: 'Rvote was successfully updated.' }
        format.json { render :show, status: :ok, location: @rvote }
      else
        format.html { render :edit }
        format.json { render json: @rvote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rvotes/1
  # DELETE /rvotes/1.json
  def destroy
    @rvote.destroy
    respond_to do |format|
      format.html { redirect_to rvotes_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rvote
      @rvote = Rvote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rvote_params
      params.require(:rvote).permit(:user_id, :review_id)
    end
end
