class QvotesController < ApplicationController
  before_action :set_qvote, only: [:show, :edit, :update, :destroy]

  # GET /qvotes
  # GET /qvotes.json
  def index
    @qvotes = Qvote.all
  end

  # GET /qvotes/1
  # GET /qvotes/1.json
  def show
  end

  # GET /qvotes/new
  def new
    @qvote = Qvote.new
  end

  # GET /qvotes/1/edit
  def edit
  end

  # POST /qvotes
  # POST /qvotes.json
  def create
    @qvote = Qvote.new(qvote_params)

    respond_to do |format|
      if @qvote.save
        format.html { redirect_to @qvote, notice: 'Qvote was successfully created.' }
        format.json { render :show, status: :created, location: @qvote }
        format.js
      else
        format.html { render :new }
        format.json { render json: @qvote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qvotes/1
  # PATCH/PUT /qvotes/1.json
  def update
    respond_to do |format|
      if @qvote.update(qvote_params)
        format.html { redirect_to @qvote, notice: 'Qvote was successfully updated.' }
        format.json { render :show, status: :ok, location: @qvote }
      else
        format.html { render :edit }
        format.json { render json: @qvote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qvotes/1
  # DELETE /qvotes/1.json
  def destroy
    @qvote.destroy
    respond_to do |format|
      format.html { redirect_to qvotes_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qvote
      @qvote = Qvote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qvote_params
      params.require(:qvote).permit(:user_id, :question_id)
    end
end
