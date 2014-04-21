class AvotesController < ApplicationController
  before_action :set_avote, only: [:show, :edit, :update, :destroy]

  # GET /avotes
  # GET /avotes.json
  def index
    @avotes = Avote.all
  end

  # GET /avotes/1
  # GET /avotes/1.json
  def show
  end

  # GET /avotes/new
  def new
    @avote = Avote.new
  end

  # GET /avotes/1/edit
  def edit
  end

  # POST /avotes
  # POST /avotes.json
  def create
    @avote = Avote.new(avote_params)

    respond_to do |format|
      if @avote.save
        format.html { redirect_to @avote, notice: 'Avote was successfully created.' }
        format.json { render :show, status: :created, location: @avote }
        format.js
      else
        format.html { render :new }
        format.json { render json: @avote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avotes/1
  # PATCH/PUT /avotes/1.json
  def update
    respond_to do |format|
      if @avote.update(avote_params)
        format.html { redirect_to @avote, notice: 'Avote was successfully updated.' }
        format.json { render :show, status: :ok, location: @avote }
      else
        format.html { render :edit }
        format.json { render json: @avote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avotes/1
  # DELETE /avotes/1.json
  def destroy
    @avote.destroy
    respond_to do |format|
      format.html { redirect_to avotes_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avote
      @avote = Avote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avote_params
      params.require(:avote).permit(:user_id, :answer_id)
    end
end
